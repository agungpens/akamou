let MasterDocument = {
    module: () => {
        return "master-document";
    },
    moduleApi: () => {
        return `api/${MasterDocument.module()}`;
    },
    moduleTemplate: () => {
        return "master-template-doc";
    },

    moduleTemplateApi: () => {
        return `api/${MasterDocument.moduleTemplate()}`;
    },
    add: () => {
        window.location.href = url.base_url(MasterDocument.module()) + "add";
    },
    ubah: (elm) => {
        let data_id = $(elm).attr("data_id");
        window.location.href = url.base_url(MasterDocument.module()) + "ubah?id=" + data_id;
    },
    back: () => {
        window.location.href = url.base_url(MasterDocument.module()) + "/";
    },

    delete: (elm) => {
        let data_id = $(elm).attr("data_id");
        let nama_template = $(elm).attr("nama_template");


        let html = `<div class="row g-3">
        <div class="col-12">
        <hr/>
        </div>
        <div class="col-12 text-center">
            <p>Apakah anda yakin akan menghapus data <b>${nama_template}</b> ini  ?</p>
        </div>
        <div class="col-12 text-center">
            <br/>
            <button class="btn btn-primary btn-sm" onclick="MasterDocument.deleteConfirm(this, '${data_id}')">Ya</button>
            <button class="btn btn-sm" onclick="message.closeDialog()">Tidak</button>
        </div>
        </div>`;

        bootbox.dialog({
            message: html
        });


    },

    deleteConfirm: (elm, id) => {
        let params = {};
        params.id = id;
        $.ajax({
            type: 'POST',
            dataType: 'json',
            data: params,
            url: url.base_url(MasterDocument.moduleApi()) + "delete",

            beforeSend: () => {
                message.loadingProses('Proses Hapus Data');
            },

            error: function () {
                message.closeLoading();
                Toast.error('Informasi', "Gagal");
            },

            success: function (resp) {
                message.closeLoading();
                if (resp.is_valid) {
                    Toast.success('Informasi', 'Data Berhasil Dihapus');
                    setTimeout(function () {
                        window.location.reload();
                    }, 1000);
                } else {
                    Toast.error('Informasi', 'Data Gagal Dihapus ', resp.message);
                }
            }
        });
    },

    getPostData: () => {
        let data = {
            'data': {
                'id': $('input#id').val(),
                'template_id': $('#template_id').val(),
                'nama_template': $('input#nama_template').val(),
                'nomor': $('input#nomor').val(),
                'tempat': $('input#tempat').val(),
                'tanggal': $('input#tanggal').val(),
                'jabatan': $('input#jabatan').val(),
                'nama': $('input#nama').val(),
                'nama_penanda_tangan': $('input#nama_penanda_tangan').val(),
                'jabatan_penanda_tangan': $('input#jabatan_penanda_tangan').val(),
                'alamat_instansi': $('textarea#alamat_instansi').val(),
                'tentang': $('textarea#tentang').val(),
            },

        };
        return data;
    },

    submit: (elm, e) => {
        e.preventDefault();
        let params = MasterDocument.getPostData();
        let form = $(elm).closest('div.row');
        // console.log(params);
        if (validation.runWithElement(form)) {
            $.ajax({
                type: 'POST',
                dataType: 'json',
                data: params,
                url: url.base_url(MasterDocument.moduleApi()) + "submit",
                beforeSend: () => {
                    message.loadingProses('Proses Simpan Data...');
                },
                error: function () {
                    message.closeLoading();
                    Toast.error('Informasi', "Gagal");
                },

                success: function (resp) {
                    message.closeLoading();
                    if (resp.is_valid) {
                        Toast.success('Informasi', 'Data Berhasil Disimpan');
                        setTimeout(function () {
                            window.location.reload();
                        }, 1000);
                    } else {
                        bootbox.dialog({
                            message: resp.message
                        });
                    }
                }
            });
        }
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
                    "url": url.base_url(MasterDocument.moduleApi()) + `getData`,
                    "type": "GET",
                    // "headers": {
                    //     'X-CSRF-TOKEN': `'${tokenApi}'`
                    // }
                },
                "deferRender": true,
                "createdRow": function (row, data, dataIndex) {
                    // console.log('row', $(row));
                },
                "columnDefs": [
                    {
                        "targets": 5,
                        "orderable": false,
                        "createdCell": function (td, cellData, rowData, row, col) {
                            $(td).addClass('td-padd');
                        }
                    },
                    {
                        "targets": 2,
                        "orderable": true,
                        "createdCell": function (td, cellData, rowData, row, col) {
                            // $(td).addClass('td-padd');
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
                            // $(td).addClass('td-padd');
                        }
                    },
                ],
                "columns": [
                    {
                        "data": "id",
                        render: function (data, type, row, meta) {
                            return meta.row + meta.settings._iDisplayStart + 1;
                        }
                    },
                    {
                        "data": "id",
                        "render": (data, type, row, meta) => {
                            return `
                            <i class="bx bx-edit" style="cursor: pointer;" data_id="${data}" onclick="MasterDocument.ubah(this)"></i>
                            <i class="bx bx-trash" style="cursor: pointer;" data_id="${data}" nama_template="${row.nama_template}" onclick="MasterDocument.delete(this, event)"></i>`;
                        }
                    },
                    {
                        "data": "nama_template",
                    },
                    {
                        "data": "file",
                    },
                    {
                        "data": "nomor",
                    },
                    {
                        "data": "tanggal",
                    },
                    {
                        "data": "tempat",
                    },
                    {
                        "data": "tentang",
                    },
                    {
                        "data": "nama_penanda_tangan",
                    },
                    {
                        "data": "jabatan",
                    },
                    {
                        "data": "jabatan_penanda_tangan",
                    },
                    {
                        "data": "nama",
                    },
                    {
                        "data": "alamat_instansi",
                    },

                ]
            });
        }
    },

    setTextEditor: () => {
        quill = new Quill('#keterangan', {
            placeholder: 'Type Something...',
            modules: { toolbar: true },
            theme: 'snow'
        });
    },

    select2All: () => {
        // Default
        const select2 = $('.select2');
        if (select2.length) {
            select2.each(function () {
                var $this = $(this);
                $this.wrap('<div class="position-relative"></div>').select2({
                    placeholder: 'Pilih Jenis',
                    dropdownParent: $this.parent()
                });
            });
        }
    },
    viewFile: (elm, e) => {
        e.preventDefault();

        let path = url.base_url($(elm).attr('path'))
        let nama_file = $(elm).attr('nama_file')
        // set time out window.open(path, '_blank')

        Swal.fire({
            title: "Unduh File ?",
            text: `Apakah Anda ingin mengunduh file ${nama_file} ?`,
            icon: "question",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Ya, Unduh!"
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: "Berhasil!",
                    text: "File berhasil diunduh.",
                    icon: "success"
                });
                window.open(path, '_blank')
            }
        });
    },
    takeFile: (elm, e) => {
        e.preventDefault();
        var uploader = $('<input type="file" accept="image/*;capture=camera" />');
        var src_file = $('#file_doc');
        uploader.click();

        uploader.on("change", function () {
            var reader = new FileReader();
            reader.onload = function (event) {
                var files = $(uploader).get(0).files[0];
                filename = files.name;
                var data_from_file = filename.split(".");
                var type_file = $.trim(data_from_file[data_from_file.length - 1]);
                if (type_file == 'docx') {
                    src_file.val(filename);
                    MasterDocument.execUploadFile(files, src_file);

                    var data = event.target.result;
                    src_file.attr("src", data);;
                } else {
                    bootbox.dialog({
                        message: "File Harus Bertipe docx"
                    });
                }
            };

            reader.readAsDataURL(uploader[0].files[0]);
        });
    },
    execUploadFile: (files, component) => {
        let formData = new FormData();
        formData.append('file', files);
        $.ajax({
            type: 'POST',
            dataType: 'json',
            data: formData,
            processData: false,
            contentType: false,
            cache: false,
            url: url.base_url(MasterDocument.moduleApi()) + "execUploadFile",

            beforeSend: () => {
                message.loadingProses("Proses Upload File...");
            },

            error: function (err) {
                toastr.error(`Gagal, ${JSON.stringify(err)}`);
                message.closeLoading();
            },

            success: function (resp) {
                message.closeLoading();
                if (resp.is_valid) {
                    Toast.success('Informasi', 'File Berhasil Diupload');
                    component.attr('path', resp.path);
                } else {
                    Toast.error('Informasi', `Upload Gagal ${resp.message}`);
                }
            }
        });
    },
    setDate: () => {
        const flatpickrRange = document.querySelector('.flatpickr');
        if (flatpickrRange) {
            flatpickrRange.flatpickr();
        }
    },

    showDataTemplate: (elm) => {
        let params = {};

        $.ajax({
            type: 'POST',
            dataType: 'html',
            data: params,
            url: url.base_url(MasterDocument.moduleApi()) + "showDataTemplate",

            beforeSend: () => {
                message.loadingProses('Proses Pengambilan Data');
            },

            error: function () {
                message.closeLoading();
                Toast.error("Informasi", "Gagal");
            },

            success: function (resp) {
                message.closeLoading();
                bootbox.dialog({
                    message: resp,
                    size: 'large'
                });
                MasterDocument.getDataTemplate();
            }
        });
    },

    getDataTemplate: async () => {
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
                    "url": url.base_url(MasterDocument.moduleTemplateApi()) + `getData`,
                    "type": "GET",
                    // "headers": {
                    //     'X-CSRF-TOKEN': `'${tokenApi}'`
                    // }
                },
                "deferRender": true,
                "createdRow": function (row, data, dataIndex) {
                    // console.log('row', $(row));
                },
                "columnDefs": [
                    {
                        "targets": 5,
                        "orderable": false,
                        "createdCell": function (td, cellData, rowData, row, col) {
                            $(td).addClass('td-padd');
                        }
                    },
                    {
                        "targets": 2,
                        "orderable": true,
                        "createdCell": function (td, cellData, rowData, row, col) {
                            // $(td).addClass('td-padd');
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
                            // $(td).addClass('td-padd');
                        }
                    },
                ],
                "columns": [
                    {
                        "data": "id",
                        render: function (data, type, row, meta) {
                            return meta.row + meta.settings._iDisplayStart + 1;
                        }
                    },
                    {
                        "data": "id",
                        "render": (data, type, row, meta) => {
                            return `
                            <i class="bx bx-edit" style="cursor: pointer;" id_template="${data}" nama_template="${row.nama_template}" onclick="MasterDocument.pilihDataTemplate(this)"></i>
                            `;
                        }
                    },
                    {
                        "data": "nama_jenis",
                    },
                    {
                        "data": "nama_template",
                    },
                    {
                        "data": "file",
                    },
                    {
                        "data": "keterangan",
                    }
                ]
            });
        }
    },

    pilihDataTemplate: (elm) => {
        let nama_template = $(elm).attr('nama_template');
        let id_template = $(elm).attr('id_template');
        $('#template_id').val(id_template);
        $('#template').val(nama_template);
        message.closeDialog();
    },

}


$(function () {
    MasterDocument.getData();
    MasterDocument.setTextEditor();
    MasterDocument.setDate();
    MasterDocument.select2All();
});
