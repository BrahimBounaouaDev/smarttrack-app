.

---

# 🛢️ SmarTrack – Oilfield & Spare Parts  
### Mobile Application • Clean Architecture • Riverpod State Management

## 📘 Overview  
**SmarTrack** is a mobile application designed to streamline the workflow of browsing, ordering, and tracking oilfield equipment and spare parts.  
The goal is to reduce the high volume of inquiry calls, improve order visibility, and organize the entire process from request to delivery.

This project is built with:
- **Clean Architecture** for scalability and maintainability  
- **Riverpod** for robust and testable state management  
- **Mock Data** to protect the company’s private information during development  

---

## 🎯 Key Features  
- Browse oilfield equipment and spare parts  
- Create and manage customer orders  
- Track order status through a clear workflow  
- Reduce manual communication and repeated inquiries  
- Clean, modern, and intuitive UI  

---

## 🧱 Architecture  
The project follows **Clean Architecture**, ensuring separation of concerns and long‑term maintainability.

### **Architecture Layers**
| Layer | Description |
|-------|-------------|
| **Presentation** | UI Screens, Widgets, Riverpod Providers |
| **Application** | Use Cases, Business Logic |
| **Domain** | Entities, Models, Repository Interfaces |
| **Infrastructure** | Data Sources, Mock Data, Repository Implementations |

### Why Clean Architecture?
- Highly scalable  
- Easy to test  
- Easy to replace data sources (e.g., switch from mock data to real API)  
- Clear boundaries between UI, logic, and data  

---

## 🔧 State Management – Riverpod  
The app uses **Riverpod** because it provides:
- Compile‑time safety  
- Predictable and maintainable state flow  
- Excellent testability  
- Flexibility for both simple and complex states  

Patterns used:
- `StateNotifier` for complex state logic  
- `Provider`, `FutureProvider`, and `StreamProvider` for data handling  
- Scoped providers for feature‑based architecture  

---

## 🧪 Data & Privacy  
This version uses **Mock Data** only.  
All real company data has been intentionally excluded to maintain confidentiality.  
The app will be connected to the real backend API in the production phase.

---

## 🚀 Project Status  
The project is currently in active development.  
The initial MVP took approximately **two months** to build, and more improvements are planned.  
The official production version will be adopted internally soon.



## 🤝 Contributions  
This project is part of an internal digital transformation initiative.  
Technical suggestions and architectural discussions are always welcome.

---

## 📝 Note  
All sensitive company information has been removed.  
Mock data is used for demonstration and development purposes only.

---


قل لي كيف تحب النسخة النهائية.
