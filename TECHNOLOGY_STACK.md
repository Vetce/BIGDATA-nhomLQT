# BIGDATA Project - Technology Stack Summary

## Project Overview
This is a comprehensive big data project focused on **delivery route optimization** and **inventory management** with a modern web interface for file management and visualization. The project combines big data processing, machine learning, and web technologies.

---

## 🏗️ Core Technology Stack

### **Big Data & Distributed Processing**
- **Hadoop** - Distributed storage and processing framework
  - HDFS (Hadoop Distributed File System) - Distributed file storage
  - YARN (Yet Another Resource Negotiator) - Resource management
  - Commands: `start-dfs.sh`, `start-yarn.sh`, `hdfs dfs` commands
  
- **Dask** - Parallel computing library for data processing
  - Distributed DataFrame operations
  - Memory-efficient large file handling
  - Configuration: Shuffle method optimization, string conversion settings

- **NFS (Network File System)** - Network-based file sharing
  - Setup configuration in `set_up_NFS.py`
  - Client mounting in `ForOtherNFS/mount_nfs_client.py`
  - Archive storage on network shares

---

### **Data Processing & ML Libraries**

#### Core Data Science Stack (Python)
- **Pandas** - Data manipulation and analysis
  - CSV file reading and processing
  - DataFrame operations with categorical dtypes
  
- **NumPy** - Numerical computing
  - Array operations, mathematical functions
  
- **Scikit-learn** - Machine Learning
  - `StandardScaler` - Feature scaling/normalization
  - `LabelEncoder` - Categorical encoding
  - `train_test_split` - Data splitting for ML models
  
- **TensorFlow & Keras** - Deep Learning
  - Neural network architectures
  - `tensorflow.keras.layers` - Neural network layers
  - `Model` - Custom model building
  - `Adam` optimizer - Gradient descent optimization
  - GPU support detection and utilization

#### Advanced ML & Optimization
- **OR-Tools (Google Optimization Tools)** - Operations Research
  - Route optimization algorithms
  - Vehicle routing problems
  - Constraint satisfaction

#### Data Analysis & Visualization
- **Matplotlib** - Basic plotting and visualization
- **Jupyter Notebooks** - Interactive analysis environment
  - `.ipynb` files for exploratory data analysis
  - 8 main notebooks for different analysis tasks

---

### **Web Technologies**

#### Frontend Stack
- **React 18.2** - JavaScript UI framework
  - Functional components with hooks
  - State management with `useState`, `useEffect`
  
- **Material-UI (MUI) 5.14** - React UI component library
  - `@mui/material` - Core components
  - `@mui/icons-material` - Icon pack
  - Responsive grid system
  - Professional UI components:
    - Tabs, Tables, Modals, Dialogs
    - Typography, Containers, Boxes
    - Buttons, Alerts, Spinners
  
- **Emotion** - CSS-in-JS styling library
  - `@emotion/react` - Core styling engine
  - `@emotion/styled` - Styled components

- **Axios 1.6** - HTTP client
  - API requests to backend server
  
- **React Scripts 5.0.1** - Build tools and development server

#### Backend Stack
- **Node.js 18+** - JavaScript runtime
  - Server-side JavaScript execution
  
- **Express 4.18** - Web application framework
  - REST API endpoints
  - Route handling
  - Middleware support
  
- **CORS** - Cross-Origin Resource Sharing
  - Enable frontend-backend communication
  
- **csv-parse 5.4.1** - CSV parsing library
  - Parse CSV files into structured data
  - Column detection and data extraction

---

### **Infrastructure & Deployment**

#### Containerization
- **Docker** - Container platform
  - Base image: `node:18-alpine` (lightweight Node.js)
  - Multi-stage builds
  - Port exposure: 3000 (frontend), 5000 (backend)
  
- **Docker Compose** - Multi-container orchestration
  - Service definition: app service
  - Volume mounting: `/home/sirin/BIGDATA:/data`
  - Port mapping
  - Environment variables

---

## 📁 Technology Usage by Module

### **1. Optimize-Delivery Module**
**Purpose:** Route optimization for delivery logistics

**Technologies:**
- Jupyter Notebooks for analysis:
  - `ETA-predict.ipynb` - Estimated Time of Arrival prediction
  - `Routes-predict.ipynb` - Route prediction
  - `Optimize-Delivery-Routes.ipynb` - Route optimization
  - `STG-forecasting.ipynb` - Supply/Demand forecasting
  
- Python libraries: Pandas, NumPy, Scikit-learn, TensorFlow
- Dask for large dataset processing
- OR-Tools for optimization algorithms
- Output: CSV results, H5 models, JSON metrics

**Data Sources:**
- `Datapack/Delivery/` - Delivery records (5 cities)
- `Datapack/Roadmap/` - Road network data
- `delivery_five_cities.csv` - Aggregated delivery data

---

### **2. Inventory-Management Module**
**Purpose:** Storage inventory optimization

**Technologies:**
- Jupyter Notebook: `Inventory-Management.ipynb`
- Data validation: `check-file.ipynb`
- Pandas for inventory data analysis
- NumPy for calculations
- Machine Learning with Scikit-learn
- Output: CSV analysis, PNG visualizations, predictions

**Data Sources:**
- `Datapack/Inventory/`
  - `product_info.csv` - Product details
  - `product_target_for_shop.csv` - Target inventory
  - `shop_info_with_geo.csv` - Store locations with geography

---

### **3. File Display App Module**
**Purpose:** Web UI for browsing and managing analysis results

**Technologies:**
- **Frontend:** React + Material-UI + Axios
- **Backend:** Node.js + Express + csv-parse
- **Deployment:** Docker + Docker Compose
- **Supported previews:**
  - CSV files (table view, first 20 rows)
  - JSON files (formatted display)
  - PNG/JPG images (inline with zoom)
  - H5 files (model download only)
  - PKL files (pickle/serialized Python objects)

---

### **4. Data Pipeline & Infrastructure**
**Purpose:** Data ingestion, storage, and preprocessing

**Technologies:**
- **HDFS Upload:** `upload_to_hdfs.py` - Data to distributed storage
- **NFS Setup:** `set_up_NFS.py` - Network file sharing
- **Data Combination:** `Optimize-Delivery/post-processing/combine.py`
- **Preprocessing:**
  - `import-delivery.py` - Delivery data import
  - `import-pickup.py` - Pickup data import
  - `import-roadmap.py` - Road data import

---

## 🔄 Data Flow Architecture

```
Raw Data (CSV)
    ↓
HDFS (Distributed Storage)
    ↓
Data Preprocessing (Python/Pandas)
    ↓
ML Models (TensorFlow/Scikit-learn)
    ↓
Results (CSV, H5, JSON, PNG)
    ↓
File Display App (React UI)
    ↓
User Browser (Material-UI Interface)
```

---

## 🗄️ Storage & File Management

### **Local Storage**
- `/home/sirin/BIGDATA/` - Project root
- `output/` - Combined processed data
- `quick-result/` - Quick analysis results
- `Inventory-Management/result/` - Inventory analysis output
- `Optimize-Delivery/optimize/result/` - Route optimization output
- `archives/` - Archived results
- `manifests/` - Metadata and tracking

### **Distributed Storage**
- HDFS paths:
  - `/bigdata/Datapack/Delivery`
  - `/bigdata/Datapack/PickUp`
  - `/bigdata/Datapack/Roadmap`
  - `/bigdata/output`

### **Network Storage**
- NFS mounted archives for cross-machine access

---

## 🔧 Development & Execution Tools

### **Python Environment**
- Virtual environment (`.venv`)
- Python 3.x
- Package management via pip

### **Build & Task Tools**
- **MSBuild** - Available as build task
- **Shell scripts:**
  - `mount_nfs_archives.sh` - NFS mounting
  - `set_up_NFS.sh` - NFS configuration
  - `setup.sh` - Application setup
  - `install.sh` - Installation script

### **Analysis & Execution**
- **Jupyter** - Interactive notebook environment
- **Python scripts** - Automation and batch processing
- **Node.js npm** - JavaScript dependency and script management

---

## 📊 Data Formats Supported

| Format | Purpose | Tools Used |
|--------|---------|-----------|
| CSV | Data storage, input/output | Pandas, csv-parse, Dask |
| JSON | Metadata, metrics, configuration | Python json, TensorFlow |
| H5 (HDF5) | ML model storage | TensorFlow/Keras |
| PKL (Pickle) | Serialized Python objects | joblib |
| PNG/JPG | Visualization output | Matplotlib |
| IPYNB | Jupyter notebooks | Jupyter |

---

## 🚀 Runtime Environments

### **Development**
- Local machine with Python 3.x
- VS Code with Jupyter extension
- Node.js 18+ with npm

### **Deployment**
- Docker containers (Alpine Linux base)
- Multi-container setup via Docker Compose
- Port exposure: 3000 (frontend), 5000 (backend)

### **Production**
- Hadoop cluster for distributed processing
- HDFS for data storage
- NFS for shared file access
- Node.js server for file serving

---

## 📈 Key Technologies by Category

### **Big Data & Processing**
✓ Hadoop (HDFS/YARN), Dask, NFS, Python subprocess management

### **Machine Learning & Data Science**
✓ TensorFlow, Keras, Scikit-learn, Pandas, NumPy, Matplotlib

### **Optimization**
✓ Google OR-Tools (routing, constraints)

### **Web Development**
✓ React, Material-UI, Express.js, Node.js, Axios

### **Infrastructure**
✓ Docker, Docker Compose, NFS

### **Data Processing**
✓ CSV-parse, Pandas, Dask, Jupyter

### **Storage & File Management**
✓ HDFS, NFS, Local filesystem, Archives with manifests

---

## 🎯 Project Statistics

- **Total Notebooks:** 8 (analysis and predictions)
- **Python Scripts:** 10+ (data pipeline, setup, utilities)
- **API Endpoints:** 4 (files, preview, download, health)
- **Supported File Types for Preview:** 5 (CSV, JSON, PNG, JPG, and others)
- **React Components:** 4 major (App, FileExplorer, FilePreview, FileDetails)
- **Main Directories:** 4 (Optimize-Delivery, Inventory-Management, file-display-app, ForOtherNFS)

---

## 📝 Documentation Structure

- `README.md` - Project overview
- `SUMMARY.md` - File display app documentation
- `DEVELOPMENT.md` - Development guide
- `SETUP_GUIDE.md` - Installation instructions
- `CHECKLIST.md` - Verification steps
- `NFS.md` - Network file system setup
- `TECHNOLOGY_STACK.md` - This file

---

## ✅ Technology Maturity

| Technology | Maturity | Usage |
|-----------|----------|-------|
| Hadoop/HDFS | Production-grade | Data storage |
| Dask | Production-grade | Data processing |
| React | Production-grade | Web UI |
| Material-UI | Production-grade | UI components |
| Express.js | Production-grade | Backend API |
| TensorFlow | Production-grade | ML models |
| Docker | Production-grade | Containerization |
| Jupyter | Development/Analysis | Exploratory work |
| OR-Tools | Production-grade | Optimization |

---

**Last Updated:** November 21, 2025  
**Project Version:** 1.0.0

