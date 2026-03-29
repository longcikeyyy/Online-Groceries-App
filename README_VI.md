# 🛒 Ứng Dụng Cửa Hàng Tạp Hóa Trực Tuyến
#

Một ứng dụng Flutter hiện đại được xây dựng với các nguyên tắc **Clean Architecture**, hỗ trợ đa môi trường, quản lý trạng thái mạnh mẽ và khả năng ghi log toàn diện.

## 📋 Mục Lục

- [🎯 Tổng Quan Dự Án](#-tổng-quan-dự-án)
- [🏗️ Kiến Trúc](#️-kiến-trúc)
- [📁 Cấu Trúc Dự Án](#-cấu-trúc-dự-án)
- [🛠️ Công Nghệ Sử Dụng](#️-công-nghệ-sử-dụng)
- [🚀 Bắt Đầu](#-bắt-đầu)
- [🌍 Thiết Lập Đa Môi Trường](#-thiết-lập-đa-môi-trường)
- [📱 Tính Năng](#-tính-năng)
- [🧪 Kiểm Thử](#-kiểm-thử)
- [📚 Tài Liệu](#-tài-liệu)
- [🤝 Đóng Góp](#-đóng-góp)

## 🎯 Tổng Quan Dự Án

Ứng dụng Cửa hàng Tạp hóa Trực tuyến này là một ứng dụng Flutter sẵn sàng cho production, thể hiện các best practices trong phát triển ứng dụng di động. Được xây dựng với **Clean Architecture**, nó cung cấp một codebase có thể mở rộng, dễ bảo trì và có thể kiểm thử, phù hợp cho các ứng dụng cấp doanh nghiệp.

### Điểm Nổi Bật

- ✅ **Clean Architecture** với sự phân tách layer rõ ràng
- ✅ **Hỗ trợ đa môi trường** (Development, Staging, Production)
- ✅ **Xử lý lỗi mạnh mẽ** với Result pattern
- ✅ **Hệ thống logging toàn diện**
- ✅ **Dependency Injection** với GetIt và Injectable
- ✅ **Quản lý trạng thái** với BLoC pattern
- ✅ **Lưu trữ bảo mật** cho dữ liệu nhạy cảm
- ✅ **Hỗ trợ đa ngôn ngữ**
- ✅ **Tự động sinh code** cho models và DI

## 🏗️ Kiến Trúc

Dự án này tuân theo các nguyên tắc **Clean Architecture** với sự phân tách rõ ràng các mối quan tâm:

```
┌─────────────────────────────────────────────────────────┐
│                    Presentation Layer                    │
│  • Các thành phần UI (Screens, Widgets)                │
│  • Quản lý trạng thái (BLoC/Cubit)                     │
│  • Routes & Navigation                                  │
└─────────────────────┬───────────────────────────────────┘
                      │
┌─────────────────────▼───────────────────────────────────┐
│                     Domain Layer                        │
│  • Business Logic (Use Cases)                          │
│  • Entities & Value Objects                            │
│  • Repository Interfaces                               │
│  • Core Abstractions                                   │
└─────────────────────┬───────────────────────────────────┘
                      │
┌─────────────────────▼───────────────────────────────────┐
│                      Data Layer                         │
│  • Repository Implementations                           │
│  • Data Sources (Remote API, Local Storage)            │
│  • Models & Mappers                                     │
│  • Tích hợp dịch vụ bên ngoài                          │
└─────────────────────────────────────────────────────────┘
```

### Lợi Ích Của Kiến Trúc

- **🔄 Khả năng kiểm thử**: Dễ dàng mock dependencies và test business logic
- **🔧 Khả năng bảo trì**: Phân tách rõ ràng giúp code dễ bảo trì
- **📈 Khả năng mở rộng**: Dễ dàng thêm tính năng mới mà không ảnh hưởng code hiện tại
- **🔀 Tính linh hoạt**: Dễ dàng thay đổi implementations (ví dụ: các cơ chế lưu trữ khác nhau)
- **🎯 Domain độc lập**: Business logic không phụ thuộc vào external frameworks

## 📁 Cấu Trúc Dự Án

```
lib/
├── 📱 app.dart                          # Cấu hình ứng dụng chính
├── 🌐 main_dev.dart                     # Entry point cho Development
├── 🌐 main_staging.dart                 # Entry point cho Staging
├── 🌐 main_prod.dart                    # Entry point cho Production
├── 
├── 🏛️ core/                             # Tiện ích chung và cấu hình
│   ├── 📦 assets_gen/                   # Các class asset được sinh tự động
│   ├── 📋 constants/                    # Hằng số ứng dụng và keys
│   ├── 🎨 enums/                        # Các enum của ứng dụng
│   ├── 🌍 env/                          # Cấu hình môi trường
│   ├── 🔧 extensions/                   # Dart extensions
│   ├── 📝 logging/                      # Implementations logging
│   └── 🛠️ utils/                        # Các hàm tiện ích
│
├── 🎯 domain/                           # Lớp business logic (Pure Dart)
│   ├── 🏛️ core/                         # Abstractions cốt lõi domain
│   │   ├── app_logger.dart             # Interface logger
│   │   ├── failures.dart               # Các loại lỗi
│   │   ├── result.dart                 # Định nghĩa kiểu Result
│   │   └── usecase.dart                # Base classes cho Use case
│   ├── 📊 entities/                     # Entities nghiệp vụ
│   ├── 📁 repositories/                 # Interfaces repository
│   ├── ⚙️ usecase/                      # Use cases nghiệp vụ
│   └── 💎 value_object/                 # Value objects domain
│
├── 💾 data/                             # Lớp truy cập dữ liệu
│   ├── 🏛️ core/                         # Tiện ích lớp data
│   │   ├── dio_failure_mapper.dart     # Mapping lỗi
│   │   ├── exceptions.dart             # Custom exceptions
│   │   ├── guard.dart                  # Guards xử lý lỗi
│   │   └── interceptors.dart           # HTTP interceptors
│   ├── 🔌 datasources/                  # Implementations data source
│   │   ├── local/                      # Local storage (SharedPrefs, SecureStorage)
│   │   └── remote/                     # Remote API (Retrofit, Dio)
│   ├── 🔄 mappers/                      # Chuyển đổi dữ liệu
│   ├── 📋 models/                       # Data transfer objects
│   └── 📁 repositories/                 # Implementations repository
│
├── 🎨 presentation/                     # Lớp UI
│   ├── 🧠 bloc/                         # Quản lý trạng thái (BLoC/Cubit)
│   ├── ❌ error/                        # Xử lý lỗi UI
│   ├── 🛣️ routes/                       # Navigation & routing
│   ├── 📱 screens/                      # Các màn hình UI
│   ├── 🔄 shared/                       # Các component UI tái sử dụng
│   └── 🎨 theme/                        # Theme ứng dụng
│
├── 💉 di/                               # Dependency injection
│   ├── domain_module.dart              # DI lớp Domain
│   ├── env_module.dart                 # DI môi trường
│   ├── injector.dart                   # Cấu hình DI
│   ├── injector.config.dart            # Code DI được sinh tự động
│   └── third_party_module.dart         # DI dependencies bên ngoài
│
└── 🌍 l10n/                             # Đa ngôn ngữ
    ├── app_localizations.dart          # Localizations được sinh tự động
    ├── app_en.arb                      # Bản dịch tiếng Anh
    └── app_vi.arb                      # Bản dịch tiếng Việt
```

### Trách Nhiệm Các Lớp

#### 🎯 Domain Layer (Business Logic Thuần Túy)
- **Entities**: Các đối tượng nghiệp vụ cốt lõi
- **Use Cases**: Các hoạt động và quy tắc nghiệp vụ
- **Repository Interfaces**: Các contract truy cập dữ liệu
- **Value Objects**: Các kiểu dữ liệu đặc thù domain
- **Core**: Tiện ích và abstractions cấp domain

#### 💾 Data Layer (Truy Cập Dữ Liệu & Dịch Vụ Bên Ngoài)
- **Repositories**: Implement các interface repository domain
- **Data Sources**: Xử lý dữ liệu bên ngoài (API, Database, Storage)
- **Models**: Data transfer objects với serialization
- **Mappers**: Chuyển đổi giữa models và entities
- **Core**: Tiện ích lớp data và xử lý lỗi

#### 🎨 Presentation Layer (UI & Tương Tác Người Dùng)
- **Screens**: Các trang UI và layouts
- **BLoC/Cubit**: Quản lý trạng thái và điều phối business logic
- **Routes**: Cấu hình navigation
- **Shared**: Các component UI tái sử dụng
- **Theme**: Styling và theming UI

#### 💉 Dependency Injection
- **Modules**: Tổ chức đăng ký dependency theo concern
- **Configuration**: Setup và khởi tạo
- **Generated Code**: Dependency graph được sinh tự động

## 🛠️ Công Nghệ Sử Dụng

### Framework Cốt Lõi
- **Flutter 3.8.1+** - Framework mobile đa nền tảng
- **Dart 3.8.1+** - Ngôn ngữ lập trình

### Kiến Trúc & Quản Lý Trạng Thái
- **flutter_bloc ^9.0.0** - Quản lý trạng thái với BLoC pattern
- **get_it ^8.0.1** - Service locator cho dependency injection
- **injectable ^2.5.0** - Sinh code cho dependency injection
- **equatable ^2.0.7** - So sánh giá trị cho Dart objects

### Networking & API
- **dio ^5.7.0** - HTTP client cho API calls
- **retrofit ^4.4.1** - HTTP client generator type-safe
- **pretty_dio_logger ^1.4.0** - Logging HTTP request/response

### Dữ Liệu & Lưu Trữ
- **shared_preferences ^2.3.3** - Lưu trữ key-value đơn giản
- **flutter_secure_storage ^9.2.3** - Lưu trữ bảo mật cho dữ liệu nhạy cảm
- **json_annotation ^4.9.0** - Annotations cho JSON serialization

### Xử Lý Lỗi & Tiện Ích
- **dartz ^0.10.1** - Lập trình hàm (Either, Option)
- **freezed ^2.5.8** - Sinh code cho immutable classes
- **logger ^2.5.0** - Framework logging

### UI & Trải Nghiệm Người Dùng
- **flutter_screenutil ^5.9.3** - Thích ứng màn hình cho các kích thước khác nhau
- **cached_network_image ^3.4.1** - Cache và load hình ảnh
- **flutter_svg ^2.1.0** - Hỗ trợ hình ảnh SVG
- **go_router ^15.0.0** - Routing declarative

### Đa Ngôn Ngữ
- **flutter_localizations** - Localization tích hợp sẵn của Flutter
- **intl ^0.20.2** - Tiện ích đa ngôn ngữ

### Công Cụ Phát Triển
- **build_runner ^2.4.14** - Runner sinh code
- **flutter_gen_runner ^5.11.0** - Sinh code asset
- **flutter_lints ^5.0.0** - Quy tắc linting Dart

## 🚀 Bắt Đầu

### Yêu Cầu Tiên Quyết

- **Flutter SDK**: 3.8.1 trở lên
- **Dart SDK**: 3.8.1 trở lên
- **IDE**: VS Code, Android Studio, hoặc IntelliJ IDEA
- **Git**: Để quản lý phiên bản

### Cài Đặt

1. **Clone repository**
   ```bash
   git clone <repository-url>
   cd Online-Grocery-App-Flutter
   ```

2. **Cài đặt dependencies**
   ```bash
   flutter pub get
   ```

3. **Sinh code**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Chạy ứng dụng**
   ```bash
   # Môi trường Development
   flutter run --flavor dev -t lib/main_dev.dart
   
   # Môi trường Staging
   flutter run --flavor staging -t lib/main_staging.dart
   
   # Môi trường Production
   flutter run --flavor prod -t lib/main_prod.dart
   ```

## 🌍 Thiết Lập Đa Môi Trường

Dự án này hỗ trợ ba môi trường với các cấu hình khác nhau:

### 🔧 Môi Trường Development
- **Entry Point**: `lib/main_dev.dart`
- **Base URL**: `https://dummyjson.com`
- **Tính năng Debug**: Được bật
- **Logging**: Chi tiết

### 🧪 Môi Trường Staging
- **Entry Point**: `lib/main_staging.dart`
- **Base URL**: `https://dummyjson.staging.com`
- **Tính năng Debug**: Hạn chế
- **Logging**: Mức Info

### 🚀 Môi Trường Production
- **Entry Point**: `lib/main_prod.dart`
- **Base URL**: `https://dummyjson.prod.com`
- **Tính năng Debug**: Tắt
- **Logging**: Chỉ mức Error

### Cấu Hình Launch VS Code

Dự án bao gồm cấu hình launch VS Code trong `.vscode/launch.json`:

```json
{
  "configurations": [
    {
      "name": "Development",
      "program": "lib/main_dev.dart",
      "args": ["--flavor", "dev"]
    },
    {
      "name": "Staging", 
      "program": "lib/main_staging.dart",
      "args": ["--flavor", "staging"]
    },
    {
      "name": "Production",
      "program": "lib/main_prod.dart", 
      "args": ["--flavor", "prod"]
    }
  ]
}
```

## 📱 Tính Năng

### 🔐 Hệ Thống Xác Thực
- **Đăng nhập bảo mật**: Xác thực username/password
- **Quản lý Token**: Lưu trữ và refresh token tự động
- **Duy trì phiên**: Nhớ phiên người dùng

### 🏪 Mua Sắm Tạp Hóa
- **Danh mục sản phẩm**: Duyệt các sản phẩm có sẵn
- **Giỏ hàng**: Thêm/xóa sản phẩm
- **Quản lý đơn hàng**: Đặt hàng và theo dõi

### 🎨 Trải Nghiệm Người Dùng
- **Thiết kế responsive**: Thích ứng với các kích thước màn hình khác nhau
- **Theme Tối/Sáng**: Khả năng chuyển đổi theme
- **Đa ngôn ngữ**: Hỗ trợ nhiều ngôn ngữ
- **Hỗ trợ Offline**: Chức năng offline cơ bản

### 🔧 Tính Năng Kỹ Thuật
- **Xử lý lỗi**: Quản lý lỗi toàn diện
- **Logging**: Ghi log ứng dụng chi tiết
- **Caching**: Cache dữ liệu và hình ảnh hiệu quả
- **Bảo mật**: Lưu trữ bảo mật cho dữ liệu nhạy cảm

## 🧪 Kiểm Thử

### Chạy Tests

```bash
# Chạy tất cả tests
flutter test

# Chạy tests với coverage
flutter test --coverage

# Chạy integration tests
flutter drive --target=test_driver/app.dart
```

### Cấu Trúc Test

```
test/
├── unit/                    # Unit tests
│   ├── domain/             # Tests lớp Domain
│   ├── data/               # Tests lớp Data
│   └── presentation/       # Tests lớp Presentation
├── widget/                 # Widget tests
├── integration/            # Integration tests
└── mocks/                  # Mock objects
```

### Chiến Lược Testing

- **Unit Tests**: Test business logic và chuyển đổi dữ liệu
- **Widget Tests**: Test các component UI và tương tác người dùng
- **Integration Tests**: Test các luồng người dùng hoàn chỉnh
- **Mock Objects**: Sử dụng cho external dependencies

## 📚 Tài Liệu

### Tài Liệu Bổ Sung

- **[Chi Tiết Tech Stack](TECH_STACK.md)** - Tài liệu tech stack toàn diện
- **[Hướng Dẫn Setup](SETUP_GUIDE.md)** - Hướng dẫn setup và sử dụng chi tiết
- **[Hướng Dẫn Clean Architecture](CLEAN_ARCHITECTURE.md)** - Nguyên tắc và patterns kiến trúc
- **[English Documentation](README.md)** - Phiên bản tiếng Anh của README này

### Tài Liệu Code

Codebase bao gồm tài liệu inline toàn diện:

- **Tài liệu Class**: Mọi class đều có tài liệu chi tiết
- **Tài liệu Method**: Các public methods bao gồm ví dụ sử dụng
- **Architecture Decision Records**: Ghi lại các quyết định kiến trúc quan trọng

## 🤝 Đóng Góp

### Quy Trình Phát Triển

1. **Fork repository**
2. **Tạo feature branch**: `git checkout -b feature/tinh-nang-tuyet-voi`
3. **Tuân theo coding standards**: Sử dụng quy tắc linting được cung cấp
4. **Viết tests**: Đảm bảo test coverage tốt
5. **Commit changes**: `git commit -m 'Thêm tính năng tuyệt vời'`
6. **Push to branch**: `git push origin feature/tinh-nang-tuyet-voi`
7. **Mở Pull Request**

### Tiêu Chuẩn Coding

- **Tuân theo conventions Dart/Flutter**
- **Sử dụng tên biến và hàm có ý nghĩa**
- **Viết tests toàn diện**
- **Tài liệu hóa public APIs**
- **Tuân theo nguyên tắc Clean Architecture**

### Checklist Code Review

- [ ] Code tuân theo kiến trúc dự án
- [ ] Tests được bao gồm và pass
- [ ] Tài liệu được cập nhật
- [ ] Không có lỗi linting
- [ ] Các cân nhắc về performance được giải quyết

## 📄 Giấy Phép

Dự án này được cấp phép theo Giấy phép MIT - xem file [LICENSE](LICENSE) để biết chi tiết.

## 👥 Đội Ngũ

- **Lead Developer**: [Tên của bạn]
- **Kiến trúc**: Clean Architecture với nguyên tắc SOLID
- **Quản lý trạng thái**: BLoC pattern
- **Tích hợp Backend**: RESTful APIs

## 🙏 Lời Cảm Ơn

- **Flutter Team** - Vì framework tuyệt vời
- **Community Packages** - Vì các third-party packages xuất sắc
- **Clean Architecture** - Nguyên tắc kiến trúc của Robert C. Martin
- **BLoC Pattern** - Felix Angelov và đội ngũ thư viện BLoC

---

**Chúc Bạn Coding Vui Vẻ! 🚀**

Để biết thêm thông tin, vui lòng tham khảo các file tài liệu bổ sung hoặc mở issue trong repository.
