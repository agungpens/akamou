 <!-- Menu -->

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
         </li>
     </ul>
 </aside>
 <!-- / Menu -->
