Name:           calligra-extra-cmake-modules
Version:        0.0.1
Release:        0
Summary:        Extra CMake modules for Calligra
License:        LGPLv2
Group:          System/Libraries
Url:            http://www.kde.org/
Source0:        extra-cmake-modules.tar.gz
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
make install DESTDIR=%{buildroot}

%files
%{_mandir}/man7/extra-cmake-modules.7
%{_datadir}/ECM-0.0.8/doc/
%{_datadir}/ECM-0.0.8/modules