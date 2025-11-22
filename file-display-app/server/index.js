const express = require('express');
const fs = require('fs');
const path = require('path');
const cors = require('cors');
const csv = require('csv-parse/sync');

const app = express();
const PORT = process.env.PORT || 5000;

// Enable CORS
app.use(cors());
app.use(express.json());

// Define the directories to scan
const DIRECTORIES = [
  {
    name: 'quick-result',
    path: 'd:\\fileht_bigdata\\BIGDATA-nhomLQT\\quick-result',
  },
  {
    name: 'Optimize-Delivery Results',
    path: 'd:\\fileht_bigdata\\BIGDATA-nhomLQT\\Optimize-Delivery\\optimize\\result',
  },
  {
    name: 'Inventory-Management Results',
    path: 'd:\\fileht_bigdata\\BIGDATA-nhomLQT\\Inventory-Management\\result',
  },
  {
    name: 'ML-result-for-inventory-management',
    path: 'd:\\fileht_bigdata\\BIGDATA-nhomLQT\\ML-result-for-inventory-management',
  },
];

// Helper function to get file info
const getFileInfo = (filePath) => {
  try {
    const stat = fs.statSync(filePath);
    const name = path.basename(filePath);
    const extension = name.split('.').pop().toLowerCase();

    return {
      name,
      extension,
      size: stat.size,
      mtime: stat.mtime,
      fullPath: filePath,
    };
  } catch (err) {
    return null;
  }
};

// API endpoint to get all files
app.get('/api/files', (req, res) => {
  try {
    const result = {};

    DIRECTORIES.forEach((dir) => {
      try {
        const files = fs.readdirSync(dir.path);
        result[dir.name] = files
          .map((file) => getFileInfo(path.join(dir.path, file)))
          .filter((file) => file !== null && !file.name.startsWith('.'))
          .sort((a, b) => b.mtime - a.mtime);
      } catch (err) {
        console.error(`Error reading directory ${dir.path}:`, err);
        result[dir.name] = [];
      }
    });

    res.json(result);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// API endpoint to download files
app.get('/api/download', (req, res) => {
  try {
    const filePath = req.query.path;

    if (!filePath) {
      return res.status(400).json({ error: 'No path provided' });
    }

    // Security check: ensure the file is within allowed directories
    const isAllowed = DIRECTORIES.some((dir) =>
      filePath.startsWith(dir.path)
    );

    if (!isAllowed) {
      return res.status(403).json({ error: 'Access denied' });
    }

    res.download(filePath, path.basename(filePath));
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// API endpoint to preview files
app.get('/api/preview', (req, res) => {
  try {
    const filePath = req.query.path;

    if (!filePath) {
      return res.status(400).json({ error: 'No path provided' });
    }

    // Security check
    const isAllowed = DIRECTORIES.some((dir) =>
      filePath.startsWith(dir.path)
    );

    if (!isAllowed) {
      return res.status(403).json({ error: 'Access denied' });
    }

    const extension = path.extname(filePath).toLowerCase().substring(1);

    if (extension === 'csv') {
      const fileContent = fs.readFileSync(filePath, 'utf-8');
      const records = csv.parse(fileContent, {
        columns: true,
        skip_empty_lines: true,
        max_records: 20,
      });

      const headers = records.length > 0 ? Object.keys(records[0]) : [];

      res.json({
        type: 'csv',
        headers,
        data: records,
      });
    } else if (extension === 'json') {
      const fileContent = fs.readFileSync(filePath, 'utf-8');
      const data = JSON.parse(fileContent);

      // Handle both array and object formats
      const isArray = Array.isArray(data);
      const records = isArray ? data.slice(0, 20) : [data];
      const headers = records.length > 0 ? Object.keys(records[0]) : [];

      res.json({
        type: 'json',
        headers,
        data: records,
      });
    } else if (['png', 'jpg', 'jpeg'].includes(extension)) {
      const fileContent = fs.readFileSync(filePath);
      const base64 = fileContent.toString('base64');
      res.json({
        type: 'image',
        data: `data:image/${extension};base64,${base64}`,
      });
    } else {
      res.status(400).json({ error: 'Preview not supported for this file type' });
    }
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Health check
app.get('/api/health', (req, res) => {
  res.json({ status: 'ok' });
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
  console.log('Scanning directories:');
  DIRECTORIES.forEach((dir) => {
    console.log(`  - ${dir.name}: ${dir.path}`);
  });
});
