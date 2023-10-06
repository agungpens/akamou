 <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
     <div class="app-brand demo">
         <a href="{{ url('/') }}" class="app-brand-link">
             <span class="app-brand-logo demo">
                 <img src="{{ asset('img/logoaka.png') }}" alt="logo akn" width="30">
             </span>
             <span class="app-brand-text demo menu-text fw-bolder ms-2">simouaka</span>
         </a>

         <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block ">
             <i class="bx bx-chevron-left bx-sm align-middle"></i>
         </a>
     </div>

     <div class="menu-inner-shadow"></div>
     <div class="menu-divider mt-0">
     </div>
     <ul class="menu-inner py-1">
         <!-- Dashboard -->
         <li class="menu-item {{ request()->is(['home', '/']) ? 'active' : '' }}
         ">
             <a href="{{ url('/') }}" class="menu-link">
                 <i class="menu-icon tf-icons bx bx-home-circle"></i>
                 <div data-i18n="Analytics">Dashboard</div>
             </a>
         </li>

         <!-- DATA MOU -->
         <li class="menu-item {{ request()->is(['data-mou']) ? 'open active' : '' }}">
             <a href="javascript:void(0);" class="menu-link menu-toggle">
                 <i class="menu-icon tf-icons bx bx-food-menu"></i>
                 <div data-i18n="Layouts">Data MOU</div>
             </a>

             <ul class="menu-sub">
                 <li class="menu-item {{ request()->is('data-mou') ? 'active' : '' }}">
                     <a href="{{ url('data-mou') }}" class="menu-link">
                         <div data-i18n="Without menu">File mou</div>
                     </a>
                 </li>
             </ul>
             <ul class="menu-sub">
                 <li class="menu-item {{ request()->is('kategori-mou') ? 'active' : '' }}">
                     <a href="{{ url('kategori-mou') }}" class="menu-link">
                         <div data-i18n="Without menu">Kategori mou</div>
                     </a>
                 </li>
             </ul>
             <ul class="menu-sub">
                 <li class="menu-item {{ request()->is('jenis-mou') ? 'active' : '' }}">
                     <a href="{{ url('jenis-mou') }}" class="menu-link">
                         <div data-i18n="Without menu">Jenis mou</div>
                     </a>
                 </li>
             </ul>
             <ul class="menu-sub">
                 <li class="menu-item {{ request()->is('level-mou') ? 'active' : '' }}">
                     <a href="{{ url('level-mou') }}" class="menu-link">
                         <div data-i18n="Without menu">Leveling mou</div>
                     </a>
                 </li>
             </ul>
         </li>

         <!-- Layouts -->
         <li class="menu-item {{ request()->is(['user']) ? 'open active' : '' }}">
             <a href="javascript:void(0);" class="menu-link menu-toggle">
                 <i class="menu-icon tf-icons bx bx-layout"></i>
                 <div data-i18n="Layouts">Menu Lain</div>
             </a>

             <ul class="menu-sub">
                 <li class="menu-item {{ request()->is('user') ? 'active' : '' }}">
                     <a href="{{ url('user') }}" class="menu-link">
                         <div data-i18n="Without menu">List User</div>
                     </a>
                 </li>
             </ul>
             <ul class="menu-sub">
                 <li class="menu-item {{ request()->is('kategori-user') ? 'active' : '' }}">
                     <a href="{{ url('kategori-user') }}" class="menu-link">
                         <div data-i18n="Without menu">Kategori User</div>
                     </a>
                 </li>
             </ul>
             <ul class="menu-sub">
                 <li class="menu-item {{ request()->is('role') ? 'active' : '' }}">
                     <a href="{{ url('role') }}" class="menu-link">
                         <div data-i18n="Without menu">Roles User</div>
                     </a>
                 </li>
             </ul>
             <ul class="menu-sub">
                 <li class="menu-item {{ request()->is('prodi') ? 'active' : '' }}">
                     <a href="{{ url('prodi') }}" class="menu-link">
                         <div data-i18n="Without menu">Prodi</div>
                     </a>
                 </li>
             </ul>

         </li>
     </ul>
 </aside>
