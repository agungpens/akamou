let Users = {
    module: () => {
        return "user/";
    },
    moduleApi: () => {
        return `api/${Users.module()}`;
    },
    add: () => {
        window.location.href = Users.module() + "add";
    },
    ubah: (elm) => {
        let data_id = $(elm).attr("data_id");
        window.location.href = Users.module() + "ubah?id=" + data_id;
    },
    delete: (elm) => {
        let data_id = $(elm).attr("data_id");
        let nama = $(elm).attr("nama");
        let url = Users.moduleApi() + "delete";
        Swal.fire(
            'Hapus Data',
            `Apakah anda ingin menghapus user <b>${nama}</b> ? `,
            'question'
        ).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: "POST",
                    url: url,
                    data: {
                        id: data_id
                    },
                    dataType: "json",
                    success: function (response) {
                        if (response.status == 'success') {
                            Swal.fire(
                                'Berhasil!',
                                `Anda telah ${response.status} menghapus user <b>${nama}</b>.`,
                                'success'
                            )
                            $('table#table-data').DataTable().destroy();
                            Users.getData();
                        } else {
                            Swal.fire(
                                'Error!',
                                `Data <b>${nama}</b> ${response.status} dihapus!`,
                                'error'
                            )
                        }
                    }
                });


            }
        })
    },

    getData: async () => {
        let tableData = $('table#table-data');
        if (tableData.length > 0) {
            tableData.DataTable({
                "processing": true,
                "serverSide": true,
                "ordering": true,
                "autoWidth": false,
                "order": [
                    [0, 'desc']
                ],
                "aLengthMenu": [
                    [25, 50, 100],
                    [25, 50, 100]
                ],
                "ajax": {
                    "url": Users.moduleApi() + `getData`,
                    "type": "GET",
                    // "headers": {
                    //     'X-CSRF-TOKEN': `'${tokenApi}'`
                    // }
                },
                "deferRender": true,
                "createdRow": function (row, data, dataIndex) {
                    // console.log('row', $(row));
                },
                "columnDefs": [{
                    "targets": 3,
                    "orderable": false,
                    "createdCell": function (td, cellData, rowData, row, col) {
                        $(td).addClass('td-padd');
                        $(td).addClass('action');
                    }
                },
                {
                    "targets": 2,
                    "orderable": false,
                    "createdCell": function (td, cellData, rowData, row, col) {
                        $(td).addClass('td-padd');
                    }
                },
                {
                    "targets": 1,
                    "orderable": false,
                    "createdCell": function (td, cellData, rowData, row, col) {
                        $(td).addClass('td-padd');
                        $(td).addClass('text-center');
                    }
                },
                {
                    "targets": 0,
                    "createdCell": function (td, cellData, rowData, row, col) {
                        $(td).addClass('td-padd');

                    }
                },
                ],
                "columns": [{
                    "data": "id",
                    render: function (data, type, row, meta) {
                        return meta.row + meta.settings._iDisplayStart + 1;
                    }
                },
                {
                    "data": "id_user",
                    "render": (data, type, row, meta) => {
                        return `
                            <i class="bx bx-edit" style="cursor: pointer;" data_id="${data}" onclick="Users.ubah(this)"></i>
                            <i class="bx bx-trash" style="cursor: pointer;" data_id="${data}" nama="${row.nama_user}" onclick="Users.delete(this, event)"></i>`;
                    }
                },
                {
                    "data": "nama_user",
                },
                {
                    "data": "nama_role",
                },
                {
                    "data": "nama_prodi",
                },

                ]
            });
        }
    },

    select2All: () => {
        // Default
        const select2 = $('.select2');
        const select2_prodi = $('.select2_prodi');
        if (select2.length) {
            select2.each(function () {
                var $this = $(this);
                $this.wrap('<div class="position-relative"></div>').select2({
                    placeholder: 'Pilih role',
                    dropdownParent: $this.parent()
                });
            });
        }
        if (select2_prodi.length) {
            select2_prodi.each(function () {
                var $this = $(this);
                $this.wrap('<div class="position-relative"></div>').select2({
                    placeholder: 'Pilih prodi',
                    dropdownParent: $this.parent()
                });
            });
        }
    },

    filter: () => {
        let nama = $('#nama').val();
        let role = $('#role').val();
        let prodi = $('#prodi').val();
        let tableData = $('table#table-data');
        tableData.DataTable().destroy();
        if (tableData.length > 0) {
            tableData.DataTable({
                "processing": true,
                "serverSide": true,
                "ordering": true,
                "autoWidth": false,
                "order": [
                    [0, 'desc']
                ],
                "aLengthMenu": [
                    [25, 50, 100],
                    [25, 50, 100]
                ],
                "ajax": {
                    "url": Users.moduleApi() + `filter`,
                    "type": "GET",
                    "data": {
                        nama: nama,
                        role: role,
                        prodi: prodi
                    },
                    // "headers": {
                    //     'X-CSRF-TOKEN': `'${tokenApi}'`
                    // }
                },
                "deferRender": true,
                "createdRow": function (row, data, dataIndex) {
                    // console.log('row', $(row));
                },
                "columnDefs": [{
                    "targets": 3,
                    "orderable": false,
                    "createdCell": function (td, cellData, rowData, row, col) {
                        $(td).addClass('td-padd');
                        $(td).addClass('action');
                    }
                },
                {
                    "targets": 2,
                    "orderable": false,
                    "createdCell": function (td, cellData, rowData, row, col) {
                        $(td).addClass('td-padd');
                    }
                },
                {
                    "targets": 1,
                    "orderable": false,
                    "createdCell": function (td, cellData, rowData, row, col) {
                        $(td).addClass('td-padd');
                        $(td).addClass('text-center');
                    }
                },
                {
                    "targets": 0,
                    "createdCell": function (td, cellData, rowData, row, col) {
                        $(td).addClass('td-padd');

                    }
                },
                ],
                "columns": [{
                    "data": "id",
                    render: function (data, type, row, meta) {
                        return meta.row + meta.settings._iDisplayStart + 1;
                    }
                },
                {
                    "data": "id_user",
                    "render": (data, type, row, meta) => {
                        return `
                            <i class="bx bx-edit" style="cursor: pointer;" data_id="${data}" onclick="Users.ubah(this)"></i>
                            <i class="bx bx-trash" style="cursor: pointer;" data_id="${data}" nama="${row.nama_user}" onclick="Users.delete(this, event)"></i>`;
                    }
                },
                {
                    "data": "nama_user",
                },
                {
                    "data": "nama_role",
                },
                {
                    "data": "nama_prodi",
                },

                ]
            });
        }


        // $.ajax({
        //     type: "POST",
        //     url: Users.moduleApi() + 'filter',
        //     data: {
        //         nama: nama,
        //         role: role,
        //         prodi: prodi,

        //     },
        //     dataType: "json",
        //     beforeSend: () => {
        //         message.loadingProses('Proses Filter Data');
        //     },
        //     success: function (response) {
        //         if (response.status == 'error') {
        //             // message.error(response.message);
        //             alert(response.message)
        //         } else if (response.status == 'success') {
        //             message.closeLoading()
        //             toastr.success(response.message, `Success`, {
        //                 "positionClass": "toast-top-center",
        //                 "closeButton": true,
        //                 "progressBar": true,
        //             });
        //         }
        //     }
        // });


    }

}


$(function () {
    Users.getData();
    // Users.getDataLogKaryawan();
    // Users.setDate();
    Users.select2All();
});

