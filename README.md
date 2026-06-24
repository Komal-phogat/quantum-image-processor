# 🌌 Quantum Image Processing Framework

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.11+](https://img.shields.io/badge/python-3.11+-blue.svg)](https://www.python.org/downloads/)

## 📝 Overview
A high-performance Quantum Image Processing (QIP) application built to bridge quantum computing simulation primitives with traditional computer vision workflows. The core framework implements hybrid quantum-classical algorithms for parallelized, accelerated image manipulation, designed with a concurrent backend to handle multi-threaded processing tasks.

---

## 🚀 Key Features

### 🧮 Quantum Algorithms
* **Quantum Edge Detection:** Uses quantum superposition and entanglement principles to identify spatial boundaries.
* **Quantum Image Compression:** Utilizes compact quantum state preparation (such as Novel Enhanced Quantum Representation / NEQR mapping) to achieve a theoretical 75% structural size reduction.
* **Quantum Feature Extraction:** Employs Hadamard gates and controlled rotations ($CR_y$) to extract high-dimensional image features.
* **Quantum Fourier Transform (QFT):** Executes localized frequency domain analysis directly within simulated quantum circuits.

### ⚡ Concurrent Core Engine
* **Multi-Threaded Pipeline:** Asynchronous backend processing engineered to handle multiple image processing requests simultaneously without thread-blocking.
* **Queue Management:** Robust task queuing to maintain operational health under high-throughput request spikes.
* **Live Analytics & Diagnostics:** Exposes metrics endpoints to monitor execution performance, system resource consumption, and processing speed (~2,000 pixels/second).

---

## 🛠️ Tech Stack & Prerequisites

* **Languages & Core:** Python 3.11+
* **Quantum Simulation:** Qiskit / PennyLane
* **Backend Architecture:** Flask / FastAPI
* **Matrix Operations:** NumPy, Pillow (PIL)

---

## 💻 Local Development

### 1. Clone & Navigate
```bash
git clone [https://github.com/Komal-phogat/quantum-image-processor.git](https://github.com/Komal-phogat/quantum-image-processor.git)
cd quantum-image-processor

```
### Setup
```bash
# Create and activate a virtual environment
python3 -m venv venv
source venv/bin/activate  # On Windows use: venv\Scripts\activate

# Install required dependencies
pip install -r requirements.txt

# Run locally
python app.py
```

##  API Documentation

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/` | Web interface for testing |
| POST | `/api/process` | Submit image for quantum processing |
| GET | `/api/result/{id}` | Get processing result |
| GET | `/api/stats` | Get server statistics |




##  License

MIT License - see LICENSE file for details.

