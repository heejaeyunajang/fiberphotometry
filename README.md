# fiberphotometry

This repository contains preprocessing, analysis, and visualization code for fiber photometry recordings during a temporal wagering task. The recordings are fiber photometry measurements of an optical sensor (GRAB), aligned to behavioral events across multiple reward and block conditions.

This repo supports:
- Extraction of average fluorescence signals aligned to task events
- Condition-specific comparisons of dopamine and acetylcholine signals (reward volume, delay, side)
- Reproduction of key photometry figures from the paper Jang et al. bioRxiv (2024)

---

## 📂 Repository Structure
```
src/
├── analysis/ % Extract and compute fiber photometry signals 
├── plotting/ % Generate figures 
```

---

## 📄 Key Scripts

| File | Description |
|------|-------------|
| `main_fiberphotometry.m` | Runs full pipeline to generate plots |
| `getFlByRewDelay.m` | Extracts fiber photometry signal for different reward delays |
| `getFlByRewSide.m` | Extracts fiber photometry signal by reward side relative to recording hemisphere (contra/ipsi) |
| `getFlByRewVol.m` | Extracts fiber photometry signal for different reward volumes |
| `plotEventAlignedDA.m` | Plots event-aligned fiber photometry signals across all the above conditions |

---

## 🧪 Requirements

- MATLAB R2021a or newer

---

## 🚀 Getting Started

### 1. Clone this repository and also the utils_core repo

```bash
git clone https://github.com/heejaeyunajang/fiberphotometry.git
git clone https://github.com/heejaeyunajang/utils_core.git
```

### 2. Add folders to your MATLAB path
```matlab
addpath(genpath('fiberphotometry/src'))
addpath(genpath('utils_core'))
```

### 3. Run the main script
main_fiberphotometry

