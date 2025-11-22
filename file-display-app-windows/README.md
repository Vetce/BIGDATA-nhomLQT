# BIGDATA File Display App - Windows Setup Guide

## ⚡ Quick Start (30 seconds)

1. **Ensure Node.js is installed** → [Download here](https://nodejs.org)
2. **Run setup once** → Double-click `setup.bat`
3. **Start the app** → Double-click `start.bat`
4. **Open browser** → http://localhost:3000

---

## 📋 Prerequisites

Before running this application, you need **Node.js** installed on your Windows machine.

### Install Node.js

1. Download Node.js (version 14 or higher) from: https://nodejs.org
2. Run the installer and follow the installation wizard
3. **Important**: Check the box to install npm (should be checked by default)
4. Restart your computer after installation

### Verify Installation

Open Command Prompt and run:
```batch
node -v
npm -v
```

Both commands should show version numbers.

---

## 🚀 Installation

### Step 1: Run Diagnostics (Optional)

Double-click `diagnose.bat` to check if everything is set up correctly:

```batch
diagnose.bat
```

This checks:
- ✓ Node.js installation
- ✓ npm installation
- ✓ Application directories
- ✓ Dependency installation

### Step 2: Run Setup

Double-click `setup.bat` or run from Command Prompt:

```batch
setup.bat
```

This will:
- Check if Node.js is installed
- Install all frontend dependencies
- Install all backend dependencies
- Display confirmation message

**Note**: You only need to run this once, or if you update the application files.

---

## ▶️ Running the Application

### Option 1: Automatic Start (Recommended)

Double-click `start.bat`:

```batch
start.bat
```

This will:
1. Start the backend server (port 5000)
2. Start the frontend application (port 3000)
3. Automatically open the app in your default browser

**Wait 5-10 seconds** for the React development server to compile before the browser opens.

### Option 2: Manual Start (Two Separate Windows)

If you prefer to see the backend and frontend logs separately:

**Terminal 1 - Backend:**
```batch
start-backend.bat
```

**Terminal 2 - Frontend:**
```batch
start-frontend.bat
```

**Important**: The backend must start before the frontend.

---

## 🌐 Accessing the Application

Once running:

- **Frontend (Web Interface)**: http://localhost:3000
- **Backend (API Server)**: http://localhost:5000

The application will display files from these directories:
- `quick-result/`
- `Optimize-Delivery/optimize/result/`
- `Inventory-Management/result/`
- `ML-result-for-inventory-management/`

---

## ⚙️ How to Stop the Application

- **If using `start.bat`**: Close the Command Prompt windows or press `Ctrl+C`
- **If using separate windows**: Press `Ctrl+C` in each Command Prompt window

---

## 🔧 Troubleshooting

### "Node.js is not installed" error

**Problem**: The script says Node.js is not found

**Solution**:
1. Download and install Node.js from https://nodejs.org
2. Choose the LTS version
3. During installation, make sure npm is selected
4. **Restart your computer** after installation
5. Try `setup.bat` again

---

### "Could not find directory" error

**Problem**: The script can't find the `file-display-app` folder

**Solution**:
1. Verify the folder structure:
   ```
   BIGDATA-nhomLQT/
   ├── file-display-app-windows/      ← Script folder
   └── file-display-app/              ← Must exist here
   ```
2. If the structure is different, manually edit the `.bat` files
3. Or run the script from the correct directory

---

### Port already in use

**Problem**: Error says "port 3000/5000 is already in use"

**Solution**:

Option A - Stop other applications:
1. Check if another application is using ports 3000 or 5000
2. Close that application
3. Restart the BIGDATA app

Option B - Use different ports:
1. Edit `.env` files to use different ports
2. Advanced option - contact administrator

Option C - Restart Windows:
```batch
shutdown /r /t 30
```

---

### React won't load in browser

**Problem**: http://localhost:3000 shows blank page or loads forever

**Solution**:
1. **Wait longer** - React compilation can take 10+ seconds on first run
2. Check the Command Prompt window shows "webpack compiled successfully"
3. Verify both backend and frontend windows show "running"
4. Run `diagnose.bat` to check your setup
5. Try restarting the app

---

### Backend server crashes

**Problem**: Server shows error messages

**Solution**:
1. Check if directories exist (they must be in the parent folder):
   - `quick-result/`
   - `Optimize-Delivery/optimize/result/`
   - `Inventory-Management/result/`
   - `ML-result-for-inventory-management/`
2. If not, the app still works but shows empty lists
3. Contact your administrator to set up these folders

---

### npm errors

**Problem**: `npm install` fails

**Solution**:
1. Try running Command Prompt **as Administrator**
2. Delete all `node_modules` folders:
   ```batch
   cd file-display-app
   rmdir /s /q node_modules
   cd server
   rmdir /s /q node_modules
   cd ..
   ```
3. Run `setup.bat` again
4. Check your internet connection

---

### "address already in use" error

**Problem**: Ports 5000 or 3000 are still in use from previous runs

**Solution**:
1. Run this command to find what's using the ports:
   ```batch
   netstat -ano | findstr :5000
   netstat -ano | findstr :3000
   ```
2. Use Task Manager to force-close the process
3. Or restart your computer
4. Try `start.bat` again

---

## 📁 File Structure

```
file-display-app-windows/
├── start.bat              ← Start both backend & frontend
├── start-backend.bat      ← Start backend only
├── start-frontend.bat     ← Start frontend only
├── setup.bat              ← Install dependencies
├── diagnose.bat           ← Check system setup
├── README.md              ← This file
└── QUICKSTART.txt         ← Quick reference

../file-display-app/
├── server/                ← Backend (Node.js + Express)
│   ├── index.js          ← Express server
│   ├── package.json      ← Backend dependencies
│   ├── .env              ← Backend configuration
│   └── node_modules/     ← Backend packages
├── src/                  ← Frontend (React)
│   ├── App.js            ← Main component
│   └── components/       ← UI components
├── public/               ← Static files
├── package.json          ← Frontend dependencies
├── .env                  ← Frontend configuration
└── node_modules/         ← Frontend packages
```

---

## 🎯 Application Features

✓ Browse files from multiple directories
✓ Preview CSV files (first 20 rows)
✓ View JSON data
✓ Display images with base64 encoding
✓ Download files directly
✓ View file metadata (size, modification date)
✓ Material-UI responsive design
✓ Tabbed navigation by folder

---

## 🔗 Useful Links

- Node.js Download: https://nodejs.org
- React Documentation: https://react.dev
- Material-UI: https://mui.com
- Express Server: https://expressjs.com

---

## 📞 Getting Help

1. Run `diagnose.bat` to check your system
2. Check the error messages in the Command Prompt windows
3. Verify all prerequisites are installed
4. Try restarting your computer
5. Contact your administrator for folder structure issues

---

**Last Updated**: November 22, 2025

## Support

For issues or questions, please refer to the main project documentation.
