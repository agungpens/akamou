@include('template.header')

<body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
        <div class="loader"></div>
        <div class="layout-container">
            @include('template.sidebar')
            <!-- Layout container -->
            <div class="layout-page">
                @include('template.navbar')
                <!-- Content wrapper -->
                <div class="content-wrapper">
                    <!-- Content -->
                    <div class="container-xxl flex-grow-1 container-p-y">
                        @include('template.breadcumb')
                        {!! isset($view_file) ? $view_file : '' !!}
                        {{-- @yield('content') --}}
                    </div>
                    <!-- / Content -->
                    @include('template.footer')
                    <div class="content-backdrop fade"></div>
                </div>
                <!-- Content wrapper -->
            </div>
            <!-- / Layout page -->
        </div>

        <!-- Overlay -->
        <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->
    @include('template.scripts')
    @yield('scripts')
    @if (isset($js))
        <script src="{{ asset($js) }}"></script>
    @endif
</body>

</html>
