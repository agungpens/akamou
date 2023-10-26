let MasterTemplateDoc = {
    module: () => {
        return "master-template-doc";
    },
    moduleApi: () => {
        return `api/${MasterTemplateDoc.module()}`;
    },
    add: () => {
        window.location.href = url.base_url(MasterTemplateDoc.module()) + "add";
    },
    ubah: (elm) => {
        let data_id = $(elm).attr("data_id");
        window.location.href = url.base_url(MasterTemplateDoc.module()) + "ubah?id=" + data_id;
    },
    back: () => {
        window.location.href = url.base_url(MasterTemplateDoc.module()) + "/";
    },

    delete: (elm) => {
        let data_id = $(elm).attr("data_id");
        let nama_jenis = $(elm).attr("nama_jenis");


        let html = `<div class="row g-3">
        <div class="col-12">
        <hr/>
        </div>
        <div class="col-12 text-center">
            <p>Apakah anda yakin akan menghapus data <b>${nama_jenis}</b> ini  ?</p>
        </div>
        <div class="col-12 text-center">
            <br/>
            <button class="btn btn-primary btn-sm" onclick="MasterTemplateDoc.deleteConfirm(this, '${data_id}')">Ya</button>
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
            url: url.base_url(MasterTemplateDoc.moduleApi()) + "delete",

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
                'nama_jenis': $('#jenis').val(),
                'nama_template': $('input#nama_template').val(),
                'keterangan': quill.root.innerHTML,
                'dokumen': $('#file_doc').val(),
                'dokumen_path': $('#file_doc').attr("path"),
            },

        };
        return data;
    },

    submit: (elm, e) => {
        e.preventDefault();
        let params = MasterTemplateDoc.getPostData();
        let form = $(elm).closest('div.row');
        // console.log(params);
        if (validation.runWithElement(form)) {
            $.ajax({
                type: 'POST',
                dataType: 'json',
                data: params,
                url: url.base_url(MasterTemplateDoc.moduleApi()) + "submit",
                // url: "/api/jenis-mou/submit",
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
                    "url": url.base_url(MasterTemplateDoc.moduleApi()) + `getData`,
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
                            <i class="bx bx-edit" style="cursor: pointer;" data_id="${data}" onclick="MasterTemplateDoc.ubah(this)"></i>
                            <i class="bx bx-trash" style="cursor: pointer;" data_id="${data}" nama_jenis="${row.nama_jenis}" onclick="MasterTemplateDoc.delete(this, event)"></i>`;
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
        let params = {};
        let path = url.base_url($(elm).attr('path'))
        // url.base_url(MasterTemplateDoc.module()) + "/";
        // let path = window.location.protocol + "//" + window.location.host + '/' + $(elm).attr('path');
        let html = `<br/><iframe src="${path}" style="width:100%; height:600px;"></iframe>`;
        bootbox.dialog({
            message: html,
            size: 'large'
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
                    MasterTemplateDoc.execUploadFile(files, src_file);

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
            url: url.base_url(MasterTemplateDoc.moduleApi()) + "execUploadFile",

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
}


$(function () {
    MasterTemplateDoc.getData();
    MasterTemplateDoc.setTextEditor();
    // MasterTemplateDoc.setDate();
    MasterTemplateDoc.select2All();
});
