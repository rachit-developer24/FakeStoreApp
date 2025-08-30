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
-  🔎 **Search Functionality** – implemented case-insensitive search for **Products and Users** with real-time filtering and empty state handling  


---

## 🛠️ Tech Stack
- Swift 5.9+  
- SwiftUI  
- MVVM  
- URLSession + async/await  
- FileManager (for JSON cache)  
- UserDefaults (for last fetch timestamp)
- Search filtering with `localizedCaseInsensitiveContains` for Products and Users  
 

---

## 📂 Project Structure  
- `ProductsService` → orchestrates API + cache logic  
- `HTTPDataDownloader` → generic networking layer with validation and refresh handling  
- `CacheManager` → protocol + `fileCacheManager` implementation for JSON storage  
- `ProductsViewModel` → manages app state, data flow, and search filtering  
- `ProductsView` → SwiftUI view displaying products with loading/error states and search bar  
- `UsersViewModel` → manages user data flow and search filtering  
- `UsersView` → SwiftUI view displaying users with loading/error states and search bar  

---

## 📷 Screenshots
<img width="1470" height="956" alt="Screenshot 2025-08-30 at 15 44 23" src="https://github.com/user-attachments/assets/8c5f0b5c-add1-4e89-8689-bfc8b8ee7ce7" />
<img width="1470" height="956" alt="Screenshot 2025-08-30 at 15 44 37" src="https://github.com/user-attachments/assets/9491c218-3c0e-4ae2-9f29-1261bee400e6" />
<img width="1470" height="956" alt="Screenshot 2025-08-30 at 15 44 55" src="https://github.com/user-attachments/assets/d7f03ae1-77e5-43ed-98a5-907b7a0cb994" />
<img width="1470" height="956" alt="Screenshot 2025-08-30 at 15 45 02" src="https://github.com/user-attachments/assets/f26eab08-9fb4-4975-b934-56d68e7467e0" />
<img width="1470" height="956" alt="Screenshot 2025-08-28 at 16 30 26" src="https://github.com/user-attachments/assets/651560d3-d3e1-4e21-bf27-3a8db59774e0" />



---

## 📝 Future Improvements
- Add Unit Tests for API + cache validation  
- Set up CI/CD pipeline with GitHub Actions  
- Extend functionality to include `/users` and `/carts` endpoints  
- Implement offline mode with background refresh  
