````md
# 📇 Business Card Scanner (Flutter)

A Flutter application that allows users to scan business cards, extract relevant information using AI, and store the data both locally and in Google Sheets.  
The app is built with a clean architecture, Bloc (Cubit) for state management, and a professional, user-friendly UI.

---

## ✨ Features

- Pick front and back images of a business card
- Preview selected images before uploading
- Extract text data from card images using Google ML Kit
- Store extracted data:
  - Locally using Hive
  - Remotely in Google Sheets
- View all uploaded cards in a Dashboard
- Easy navigation via **“See Uploaded Cards”** button
- Clean, scalable architecture with minimal complexity

---

## 🛠️ Tech Stack

- Flutter
- Google ML Kit (Text Recognition)
- Bloc (Cubit) – State Management
- Hive – Local Database
- Google Sheets API (via App Script)
- Clean Architecture

---

## 🚀 Setup Steps

### 1️⃣ Clone the Repository
```bash
git clone <your-repo-url>
cd business_card_scanner
````

### 2️⃣ Install Dependencies

```bash
flutter pub get
```

### 3️⃣ Platform Setup

#### Android

* Ensure required camera and storage permissions are added in `AndroidManifest.xml`
* Minimum SDK should satisfy Google ML Kit requirements

### 4️⃣ Run the App

```bash
flutter run
```

---

## 🤖 AI Implementation (Text Extraction)

The app uses **Google ML Kit Text Recognition** to extract text from uploaded business card images.

### Flow:

1. User selects front and/or back images of the card
2. Images are processed using Google ML Kit
3. Text is extracted from the card
4. Extracted text is parsed into structured data
5. Data is prepared for local and remote storage

### Why Google ML Kit?

* Fast on-device text recognition
* No backend server needed
* Works offline after initial model download

---

## 📊 Google Sheets Integration

The app uses **Google Sheets App Script** to upload extracted card data.

### How it works:

1. A Google Sheet is created with predefined columns
2. A Google App Script Web App is deployed
3. Flutter sends extracted card data via HTTP POST
4. App Script inserts the data into the sheet
5. Each scanned card is saved as a new row

### Benefits:

* No backend infrastructure required
* Easy access and sharing of data
* Scalable for small to medium use cases

---

## 🗄️ Local Storage with Hive

**Hive** is used for storing card data locally.

### Usage:

* Saves extracted business card data
* Enables offline access
* Improves dashboard performance

Each scanned card is stored locally before syncing to Google Sheets.

---

## 🧱 Architecture Explanation

The project follows **Clean Architecture** for better scalability and maintainability.

### Layers:

#### Presentation Layer

* Flutter UI
* Bloc (Cubit) for state management
* Handles user interactions and UI states

#### Domain Layer

* Business logic
* Entities (Business Card Model)
* Use cases

#### Data Layer

* Google ML Kit text recognition service
* Hive local data source
* Google Sheets remote data source
* Repository implementations

### Why Cubit?

* Less boilerplate than Bloc
* Simple and efficient
* Suitable for this app’s complexity level

---

## 🧭 App Flow

1. User selects front and back images
2. Preview is displayed
3. User uploads images
4. Text is extracted using ML Kit
5. Data is saved locally and in Google Sheets
6. User views all scanned cards on the dashboard

---

## 📱 UI & UX

* Professional and clean UI
* Smooth navigation
* Clear user actions
* Dashboard-focused design

---