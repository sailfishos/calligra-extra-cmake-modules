Name:           calligra-extra-cmake-modules
Version:        0.0.8
Release:        0
Summary:        Extra CMake modules for Calligra
License:        LGPLv2
Group:          System/Libraries
Url:            http://www.kde.org/
Source0:        %{name}-%{version}.tar.gz
BuildRequires:  fdupes, cmake
#Requires:       

%description
Extra CMake modules for Calligra

%prep
%setup -q -n %{name}-%{version}/%{name}

%build
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr ..
make %{?_smp_mflags}

%install
cd build
make install DESTDIR=%{buildroot}

%files
/usr/man/man7/extra-cmake-modules.*
%{_datadir}/ECM-0.0.8