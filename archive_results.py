

import os
import json
import shutil
import hashlib
from pathlib import Path
from datetime import datetime
import logging

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# Result folders
FOLDERS = {
    'optimize_delivery': '/home/sirin/BIGDATA/Optimize-Delivery/optimize/result',
    'inventory_management': '/home/sirin/BIGDATA/Inventory-Management/result',
    'DL_Routes': '/home/sirin/BIGDATA/quick-result',
    'ML_Inventory': '/home/sirin/BIGDATA/ML-result-for-inventory-management'
}

# Archive location
ARCHIVE_DIR = '/home/sirin/BIGDATA/archives'
MANIFEST_DIR = '/home/sirin/BIGDATA/manifests'

def create_directories():
    os.makedirs(ARCHIVE_DIR, exist_ok=True)
    os.makedirs(MANIFEST_DIR, exist_ok=True)
    logger.info(f"✓ Archive directory: {ARCHIVE_DIR}")
    logger.info(f"✓ Manifest directory: {MANIFEST_DIR}")

def calculate_file_hash(file_path):
    sha256_hash = hashlib.sha256()
    with open(file_path, "rb") as f:
        for byte_block in iter(lambda: f.read(4096), b""):
            sha256_hash.update(byte_block)
    return sha256_hash.hexdigest()

def create_manifest(folder_name, folder_path):
    manifest = {
        'timestamp': datetime.now().isoformat(),
        'folder_name': folder_name,
        'folder_path': folder_path,
        'files': []
    }
    
    if not os.path.exists(folder_path):
        logger.error(f"✗ Folder not found: {folder_path}")
        return None
    
    total_size = 0
    for file_name in sorted(os.listdir(folder_path)):
        file_path = os.path.join(folder_path, file_name)
        
        if os.path.isfile(file_path):
            file_size = os.path.getsize(file_path)
            file_hash = calculate_file_hash(file_path)
            total_size += file_size
            
            file_info = {
                'name': file_name,
                'size': file_size,
                'hash': file_hash,
                'type': os.path.splitext(file_name)[1][1:] or 'unknown'
            }
            manifest['files'].append(file_info)
            logger.info(f"  ✓ {file_name} ({file_size} bytes)")
    
    manifest['total_size'] = total_size
    manifest['file_count'] = len(manifest['files'])
    
    return manifest

def save_manifest(manifest, folder_key):
    manifest_file = os.path.join(MANIFEST_DIR, f"{folder_key}_manifest_{datetime.now().strftime('%Y%m%d_%H%M%S')}.json")
    with open(manifest_file, 'w') as f:
        json.dump(manifest, f, indent=2)
    logger.info(f"✓ Manifest saved: {manifest_file}")
    return manifest_file

def archive_folder(folder_name, folder_path):
    archive_name = f"{folder_name}_{datetime.now().strftime('%Y%m%d_%H%M%S')}.zip"
    archive_path = os.path.join(ARCHIVE_DIR, archive_name)
    
    try:
        shutil.make_archive(
            archive_path.replace('.zip', ''),
            'zip',
            folder_path
        )
        archive_size = os.path.getsize(archive_path)
        logger.info(f"✓ Archived: {archive_name} ({archive_size} bytes)")
        return archive_path
    except Exception as e:
        logger.error(f"✗ Error archiving {folder_name}: {e}")
        return None

def create_storage_catalog():
    catalog = {
        'created': datetime.now().isoformat(),
        'folders': {}
    }
    
    print("\n" + "="*70)
    print("CREATING STORAGE CATALOG")
    print("="*70 + "\n")
    
    for folder_key, folder_path in FOLDERS.items():
        logger.info(f"\nProcessing: {folder_key}")
        logger.info(f"Path: {folder_path}\n")
        
        # Create manifest
        manifest = create_manifest(folder_key, folder_path)
        if manifest:
            manifest_file = save_manifest(manifest, folder_key)
            
            # Archive folder
            archive_path = archive_folder(folder_key, folder_path)
            
            catalog['folders'][folder_key] = {
                'path': folder_path,
                'manifest': manifest_file,
                'archive': archive_path,
                'file_count': manifest['file_count'],
                'total_size': manifest['total_size']
            }
    
    # Save catalog
    catalog_file = os.path.join(MANIFEST_DIR, f"storage_catalog_{datetime.now().strftime('%Y%m%d_%H%M%S')}.json")
    with open(catalog_file, 'w') as f:
        json.dump(catalog, f, indent=2)
    
    logger.info(f"\n✓ Catalog saved: {catalog_file}")
    return catalog_file

def generate_summary_report():
    print("STORAGE SUMMARY")
    
    for folder_key, folder_path in FOLDERS.items():
        files = os.listdir(folder_path) if os.path.exists(folder_path) else []
        total_size = sum(os.path.getsize(os.path.join(folder_path, f)) 
                        for f in files if os.path.isfile(os.path.join(folder_path, f)))
        
        print(f"\n{folder_key}:")
        print(f"  Files: {len(files)}")
        print(f"  Total Size: {total_size / (1024*1024):.2f} MB")
        print(f"  Location: {folder_path}")
    
    print("\n" + "="*70)

def main():
    print("\n" + "="*70)
    print("DATA STORAGE AND ARCHIVAL TOOL")
    print("="*70)
    
    try:
        # Create directories
        create_directories()
        
        # Create storage catalog with manifests and archives
        catalog_file = create_storage_catalog()
        
        # Generate summary
        generate_summary_report()
        
        print(f"\n✓ Storage catalog: {catalog_file}")
        print("\nFiles are now organized in:")
        print(f"  - Manifests: {MANIFEST_DIR}")
        print(f"  - Archives: {ARCHIVE_DIR}")
        print("\n" + "="*70 + "\n")
        
        return 0
        
    except Exception as e:
        logger.error(f"✗ Error: {e}")
        return 1

if __name__ == "__main__":
    exit(main())
