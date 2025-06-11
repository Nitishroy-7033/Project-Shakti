# 🛡️ Women Safety App

Empowering women commuters with **automated safety tools**, **real-time emergency response**, and **community support**.

---

## 🚀 Objective

Empower women commuters with:
- Automated trip check-ins  
- Discreet panic tools  
- Real-time emergency escalation  
- Community-driven safety alerts  

---

## 🛣️ Core Features

### ⏰ Trip Scheduler & Timer
- Set departure time and trip duration.
- Auto-arms safety timer during trips.

### 🔔 Safety Check-In Popup
- Alerts via sound + vibration.
- Response options: `I AM SAFE`, `EXTEND 10 MIN`, `SOS`.

### 🚨 Automatic Escalation
- No response within 60 seconds triggers:
  - GPS location sharing
  - Front camera video/audio stream
  - Alert to Trusted Contacts

### 🌐 Community SOS Broadcast
- SOS message is broadcasted to nearby users with your location and request for help.

### 🗺️ Route Monitoring & Predictive Alerts
- Detect route deviations or extended stops.
- Prompt user confirmation in suspicious scenarios.

### 📞 One-Tap Emergency Calls
- Quick access to:
  - Police
  - Medical
  - Harassment helplines
  - Custom quick-dial numbers

### 📱 Fake Call Feature
- Schedule or trigger fake incoming calls to distract/deter.

### 🎥 Hidden Video/Audio Recorder
- Discreet evidence collection with silent record activation.

### 🤫 Discreet Panic Mode
- Power-button sequence or phone shake to trigger silent SOS.

### ⭐ Safety Score & Tips
- Route risk scoring (based on crime data, lighting, etc.)
- Personalized safety recommendations.

---

## 🔧 Technology Stack

- **Frontend:** Flutter (Android & iOS)
- **Backend:** Node.js + Express
- **Database:** MongoDB
- **Real-time Communication:** WebRTC
- **Maps & Routing:** Google Maps API / Mapbox
- **Push Notifications:** Firebase Cloud Messaging / APNs
- **Authentication:** OAuth2 + JWT

---

## 🏁 Project Milestones

| Phase | Description |
|-------|-------------|
| **MVP (4 weeks)** | Trip timer, check-in popup, SOS to trusted contacts |
| **Live Feed (2 weeks)** | Real-time GPS + video/audio streaming |
| **Community & Routing (3 weeks)** | Community SOS, route deviation alerts |
| **Advanced Tools (3 weeks)** | Fake calls, stealth recording, panic mode |

---

## 📦 Setup Instructions

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Node.js and MongoDB
- Firebase / APNs credentials

### Clone the Repository

```bash
git clone https://github.com/MrNitishroy/project_shakti.git
cd project_shakti
