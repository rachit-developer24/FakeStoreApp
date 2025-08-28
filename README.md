# 🛍️ Fake Store API App  

A SwiftUI iOS app that fetches products from [Fake Store API](https://fakestoreapi.com) using MVVM architecture, a generic HTTP downloader, and a generic cache manager. The app includes a 10-minute refresh logic to minimize unnecessary API calls and improve performance.  

---

## 🚀 Features
- MVVM Architecture – clean separation of UI, business logic, and networking  
- Generic HTTP Downloader – reusable `fetchData<T: Codable>` for multiple endpoints  
- Generic Cache Manager – JSON-based caching layer for any `Codable` model  
- 10-Minute Refresh Logic – reduces redundant API calls with smart caching  
- Async/Await Networking – modern Swift concurrency for cleaner code  
- Error Handling – robust error management using a custom `ApiError` enum  
- Loading States – handles `.loading`, `.empty`, `.error`, `.completed`  

---

## 🛠️ Tech Stack
- Swift 5.9+  
- SwiftUI  
- MVVM  
- URLSession + async/await  
- FileManager (for JSON cache)  
- UserDefaults (for last fetch timestamp)  

---

## 📂 Project Structure
- `ProductsService` → orchestrates API + cache logic  
- `HTTPDataDownloader` → generic networking layer with validation and refresh handling  
- `CacheManager` → protocol + `fileCacheManager` implementation for JSON storage  
- `ProductsViewModel` → manages app state and data flow  
- `ProductsView` → SwiftUI view displaying products with loading/error states  

---

## 📷 Screenshots
 <img width="1470" height="956" alt="Screenshot 2025-08-28 at 16 13 08" src="https://github.com/user-attachments/assets/3261fecb-5c26-45b4-9d25-10f5fcc75f90" />
<img width="1470" height="956" alt="Screenshot 2025-08-28 at 16 15 03" src="https://github.com/user-attachments/assets/7b74dfdc-1c46-4158-8e5f-5cc0a43f88d1" />
<img width="1470" height="956" alt="Screenshot 2025-08-28 at 16 15 03" src="https://github.com/user-attachments/assets/bef0449a-3844-4c71-9371-3659d066b87f" />
<img width="1470" height="956" alt="Screenshot 2025-08-28 at 16 30 26" src="https://github.com/user-attachments/assets/651560d3-d3e1-4e21-bf27-3a8db59774e0" />



---

## 📝 Future Improvements
- Add Unit Tests for API + cache validation  
- Set up CI/CD pipeline with GitHub Actions  
- Extend functionality to include `/users` and `/carts` endpoints  
- Implement offline mode with background refresh  
