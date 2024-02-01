

let Kegiatan = {
    module: () => {
        return "kegiatan";
    },
    moduleApi: () => {
        return `api/${Kegiatan.module()}`;
    },
    moduleDokumenMou: () => {
        return "dokumen-mou";
    },

    moduleApiDokumenMou: () => {
        return `api/${Kegiatan.moduleDokumenMou()}`;
    },
    moduleDokumenMoa: () => {
        return "dokumen-moa";
    },

    moduleApiDokumenMoa: () => {
        return `api/${Kegiatan.moduleDokumenMoa()}`;
    },
    moduleKategori: () => {
        return "kategori-doc";
    },

    moduleApiKategori: () => {
        return `api/${Kegiatan.moduleKategori()}`;
    },
    moduleLevel: () => {
        return "level-doc";
    },

    moduleApiLevel: () => {
        return `api/${Kegiatan.moduleLevel()}`;
    },
    moduleProdi: () => {
        return "prodi";
    },

    moduleApiProdi: () => {
        return `api/${Kegiatan.moduleProdi()}`;
    },

    add: () => {
        window.location.href = url.base_url(Kegiatan.module()) + "add";
    },
    ubah: (elm) => {
        let data_id = $(elm).attr("data_id");
        window.location.href =
            url.base_url(Kegiatan.module()) + "ubah?id=" + data_id;
    },
    detail: (elm) => {
        let data_id = $(elm).attr("data_id");
        window.location.href = url.base_url(Kegiatan.module()) + "detail?id=" + data_id;
    },
    back: () => {
        window.location.href = url.base_url(Kegiatan.module()) + "/";
    },

    delete: (elm) => {
        let data_id = $(elm).attr("data_id");
        // console.log(data_id);return;
        let html = `<div class="row g-3">
        <div class="col-12">
        <hr/>
        </div>
        <div class="col-12 text-center">
            <p>Apakah anda yakin akan menghapus semua data ini  ?</p>
        </div>
        <div class="col-12 text-center">
            <br>
            <button class="btn btn-primary btn-sm" onclick="Kegiatan.deleteConfirm(this, '${data_id}')">Ya</button>
            <button class="btn btn-sm" onclick="message.closeDialog()">Tidak</button>
        </div>
        </div>`;

        bootbox.dialog({
            message: html,
        });
    },

    deleteConfirm: (elm, id) => {
        let params = {};
        params.id = id;
        params.user_id = user.getUserId();
        $.ajax({
            type: "POST",
            dataType: "json",
            data: params,
            url: url.base_url(Kegiatan.moduleApi()) + "delete",

            beforeSend: () => {
                message.loadingProses("Proses Hapus Data");
            },

            error: function () {
                message.closeLoading();
                Toast.error("Informasi", "Gagal");
            },

            success: function (resp) {
                message.closeLoading();
                if (resp.is_valid) {
                    Toast.success("Informasi", "Data Berhasil Dihapus");
                    setTimeout(function () {
                        Kegiatan.back();
                    }, 1000);
                } else {
                    Toast.error(
                        "Informasi",
                        "Data Gagal Dihapus ",
                        resp.message
                    );
                }
            },
        });
    },
    deleteDataLampiran: (elm) => {
        let data_id = $(elm).attr("data_id");

        let html = `<div class="row g-3">
        <div class="col-12">
        <hr/>
        </div>
        <div class="col-12 text-center">
            <p>Apakah anda yakin akan menghapus data ini  ?</p>
        </div>
        <div class="col-12 text-center">
            <br>
            <button class="btn btn-primary btn-sm" onclick="Kegiatan.deleteDataLampiranConfirm(this, '${data_id}')">Ya</button>
            <button class="btn btn-sm" onclick="message.closeDialog()">Tidak</button>
        </div>
        </div>`;

        bootbox.dialog({
            message: html,
        });
    },

    deleteDataLampiranConfirm: (elm, id) => {
        let params = {};
        params.id = id;
        params.user_id = user.getUserId();
        $.ajax({
            type: "POST",
            dataType: "json",
            data: params,
            url: url.base_url(Kegiatan.moduleApi()) + "deleteDataLampiran",

            beforeSend: () => {
                message.loadingProses("Proses Hapus Data");
            },

            error: function () {
                message.closeLoading();
                Toast.error("Informasi", "Gagal");
            },

            success: function (resp) {
                message.closeLoading();
                if (resp.is_valid) {
                    Toast.success("Informasi", "Data Berhasil Dihapus");
                    setTimeout(function () {
                        Kegiatan.back();
                    }, 1000);
                } else {
                    Toast.error(
                        "Informasi",
                        "Data Gagal Dihapus ",
                        resp.message
                    );
                }
            },
        });
    },

    getPostData: () => {
        let data = {
            data: {
                id: $("input#id").val(),
                nomor_mou: $("input#nomor_mou").val(),
                nomor_moa: $("input#nomor_moa").val(),
                kegiatan: quill.root.innerHTML,
            },
            data_lampiran: Kegiatan.getPostdataLampiran(),
            user_id: user.getUserId()
        };
        return data;
    },
    getPostDataUpdated: () => {
        let data = {
            data: {
                id: $("input#id").val(),
                nomor_mou: $("#nomor_mou").val(),
                nomor_moa: $("#nomor_moa").val(),
                tanggal_dibuat: $("#tanggal_dibuat").val(),
                tanggal_berakhir: $("#tanggal_berakhir").val(),
                jenis: $("#jenis").val(),
                level: $("#level").val(),
                kategori: $("#kategori").val(),
                status: $("#status").val(),
                kerja_sama_dengan: $("#kerja_sama_dengan").val(),
                relevansi_prodi: $("#relevansi_prodi").val(),
                file: $('input#file').attr('src'),
                tipe: $('input#file').attr('tipe'),
            },
            user_id: user.getUserId()
        };
        return data;
    },


    submit: (elm, e) => {
        e.preventDefault();
        let params = Kegiatan.getPostData();
        // console.log(params); return;
        let form = $(elm).closest("div.form");

        if (validation.runWithElement(form)) {
            $.ajax({
                type: "POST",
                dataType: "json",
                data: params,
                url: url.base_url(Kegiatan.moduleApi()) + "submit",
                beforeSend: () => {
                    message.loadingProses("Proses Simpan Data...");
                },
                error: function () {
                    message.closeLoading();
                    Toast.error("Informasi", "Gagal");
                },

                success: function (resp) {
                    message.closeLoading();
                    if (resp.is_valid) {
                        Toast.success("Informasi", "Data Berhasil Disimpan");
                        setTimeout(function () {
                            window.location.reload();
                        }, 1000);
                    } else {
                        bootbox.dialog({
                            message: resp.message,
                        });
                    }
                },
            });
        }
    },

    updated: (elm, e) => {
        e.preventDefault();
        let params = Kegiatan.getPostDataUpdated();
        let form = $(elm).closest("div.row");

        if (validation.runWithElement(form)) {
            $.ajax({
                type: "POST",
                dataType: "json",
                data: params,
                url: url.base_url(Kegiatan.moduleApi()) + "updated",
                beforeSend: () => {
                    message.loadingProses("Proses Simpan Data...");
                },
                error: function () {
                    message.closeLoading();
                    Toast.error("Informasi", "Gagal");
                },

                success: function (resp) {
                    message.closeLoading();
                    if (resp.is_valid) {
                        Toast.success("Informasi", "Data Berhasil Disimpan");
                        setTimeout(function () {
                            window.location.reload();
                        }, 1000);
                    } else {
                        bootbox.dialog({
                            message: resp.message,
                        });
                    }
                },
            });
        }
    },

    getData: async () => {
        let tableData = $("table#table-data");
        tableData.DataTable().destroy();
        let params = {};

        params.status = $("#status").val()

        if (tableData.length > 0) {
            tableData.DataTable({
                processing: true,
                serverSide: true,
                ordering: true,
                autoWidth: false,
                order: [[0, "desc"]],
                aLengthMenu: [
                    [25, 50, 100],
                    [25, 50, 100],
                ],
                ajax: {
                    url: url.base_url(Kegiatan.moduleApi()) + `getData`,
                    type: "POST",
                    data: params,
                    // "headers": {
                    //     'X-CSRF-TOKEN': `'${tokenApi}'`
                    // }
                },
                deferRender: true,
                createdRow: function (row, data, dataIndex) {
                    // console.log('row', $(row));
                },
                columnDefs: [
                    {
                        targets: 2,
                        orderable: true,
                        createdCell: function (
                            td,
                            cellData,
                            rowData,
                            row,
                            col
                        ) {
                            // $(td).addClass('td-padd');
                        },
                    },
                    {
                        targets: [0, 1],
                        orderable: false,
                        createdCell: function (
                            td,
                            cellData,
                            rowData,
                            row,
                            col
                        ) {
                            $(td).addClass("td-padd");
                            $(td).addClass("text-center");
                        },
                    },
                    {
                        targets: 0,
                        createdCell: function (
                            td,
                            cellData,
                            rowData,
                            row,
                            col
                        ) {
                            // $(td).addClass('td-padd');
                        },
                    },
                ],
                columns: [
                    {
                        data: "id",
                        render: function (data, type, row, meta) {
                            return meta.row + meta.settings._iDisplayStart + 1;
                        },
                    },
                    {
                        data: "id",
                        render: (data, type, row, meta) => {
                            return `
                            <button class="btn btn-warning  mb-2" data_id="${data}" onclick="Kegiatan.ubah(this)">
                                <i class="bx bx-edit"></i>
                            </button>
                                `;
                        },
                    },

                    {
                        data: "nomor_mou",
                        render: (data, type, row, meta) => {
                            return `
                            ${row.nomor_doc_mou != null ? row.nomor_doc_mou.nomor_mou : ''}
                                `;
                        },
                    },

                    {
                        data: "nomor_moa",
                        render: (data, type, row, meta) => {
                            return `
                            ${row.nomor_doc_moa != null ? row.nomor_doc_moa.nomor_moa : ''}
                                `;
                        },
                    },
                    {
                        data: "kegiatan",
                    },

                ],
            });
        }
    },

    setTextEditor: () => {
        quill = new Quill("#kegiatan", {
            placeholder: "Type Something...",
            modules: { toolbar: true },
            theme: "snow",
        });
    },

    select2All: () => {
        const select2 = $(".select2");
        if (select2.length) {
            select2.each(function () {
                var $this = $(this);
                $this.wrap('<div class="position-relative"></div>').select2({
                    placeholder: "Pilih Data",
                    dropdownParent: $this.parent(),
                });
            });
        }
    },
    viewFile: (elm, e) => {
        e.preventDefault();

        let path = url.base_url($(elm).attr("path"));
        let nama_file = $(elm).attr("nama_file");
        // set time out window.open(path, '_blank')

        Swal.fire({
            title: "Unduh File ?",
            text: `Apakah Anda ingin mengunduh file ${nama_file} ?`,
            icon: "question",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Ya, Unduh!",
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: "Berhasil!",
                    text: "File berhasil diunduh.",
                    icon: "success",
                });
                window.open(path, "_blank");
            }
        });
    },
    viewFileWithModal: (elm, e) => {
        e.preventDefault();
        let params = {};
        let path = url.base_url($(elm).attr('path'));
        let html = `<br> <iframe src="${path}" style="width:100%; height:600px;"></iframe>`;
        bootbox.dialog({
            message: html,
            size: 'large'
        });
    },
    takeFile: (elm, e) => {
        e.preventDefault();
        var uploader = $(
            '<input type="file" accept="image/*;capture=camera" />'
        );
        var src_file = $("#file_doc");
        uploader.click();

        uploader.on("change", function () {
            var reader = new FileReader();
            reader.onload = function (event) {
                var files = $(uploader).get(0).files[0];
                filename = files.name;
                var data_from_file = filename.split(".");
                var type_file = $.trim(
                    data_from_file[data_from_file.length - 1]
                );
                if (type_file == "pdf") {
                    src_file.val(filename);
                    Kegiatan.execUploadFile(files, src_file);

                    var data = event.target.result;
                    src_file.attr("src", data);
                } else {
                    bootbox.dialog({
                        message: "File Harus Bertipe pdf",
                    });
                }
            };

            reader.readAsDataURL(uploader[0].files[0]);
        });
    },
    execUploadFile: (files, component) => {
        let formData = new FormData();
        formData.append("file", files);
        $.ajax({
            type: "POST",
            dataType: "json",
            data: formData,
            processData: false,
            contentType: false,
            cache: false,
            url: url.base_url(Kegiatan.moduleApi()) + "execUploadFile",

            beforeSend: () => {
                message.loadingProses("Proses Upload File...");
            },

            error: function (err) {
                toastr.error(`Gagal, ${JSON.stringify(err)} `);
                message.closeLoading();
            },

            success: function (resp) {
                message.closeLoading();
                if (resp.is_valid) {
                    Toast.success("Informasi", "File Berhasil Diupload");
                    component.attr("path", resp.path);
                } else {
                    Toast.error("Informasi", `Upload Gagal ${resp.message} `);
                }
            },
        });
    },
    setDate: () => {
        const flatpickrRange = document.querySelectorAll(".flatpickr");

        if (flatpickrRange) {
            flatpickrRange.forEach((flatpickrRange) => {
                flatpickrRange.flatpickr();
            });
        }
    },
    showDataMou: (elm) => {
        let params = {};

        $.ajax({
            type: "POST",
            dataType: "html",
            data: params,
            url: url.base_url(Kegiatan.moduleApi()) + "showDataMou",

            beforeSend: () => {
                message.loadingProses("Proses Pengambilan Data");
            },

            error: function () {
                message.closeLoading();
                Toast.error("Informasi", "Gagal");
            },

            success: function (resp) {
                message.closeLoading();
                bootbox.dialog({
                    message: resp,
                    size: "large",
                });
                Kegiatan.getDataMou();
            },
        });
    },

    getDataMou: async () => {
        let tableData = $("table#table-data");
        if (tableData.length > 0) {
            tableData.DataTable({
                processing: true,
                serverSide: true,
                ordering: true,
                autoWidth: false,
                order: [[0, "desc"]],
                aLengthMenu: [
                    [25, 50, 100],
                    [25, 50, 100],
                ],
                ajax: {
                    url:
                        url.base_url(Kegiatan.moduleApiDokumenMou()) +
                        `getData`,
                    type: "POST",
                    // "headers": {
                    //     'X-CSRF-TOKEN': `'${tokenApi}'`
                    // }
                },
                deferRender: true,
                createdRow: function (row, data, dataIndex) {
                    // console.log('row', $(row));
                },
                columnDefs: [
                    {
                        targets: 5,
                        orderable: false,
                        createdCell: function (
                            td,
                            cellData,
                            rowData,
                            row,
                            col
                        ) {
                            $(td).addClass("td-padd");
                        },
                    },
                    {
                        targets: 2,
                        orderable: true,
                        createdCell: function (
                            td,
                            cellData,
                            rowData,
                            row,
                            col
                        ) {
                            // $(td).addClass('td-padd');
                        },
                    },
                    {
                        targets: 1,
                        orderable: false,
                        createdCell: function (
                            td,
                            cellData,
                            rowData,
                            row,
                            col
                        ) {
                            $(td).addClass("td-padd");
                            $(td).addClass("text-center");
                        },
                    },
                    {
                        targets: 0,
                        createdCell: function (
                            td,
                            cellData,
                            rowData,
                            row,
                            col
                        ) {
                            // $(td).addClass('td-padd');
                        },
                    },
                ],
                columns: [
                    {
                        data: "id",
                        render: function (data, type, row, meta) {
                            return meta.row + meta.settings._iDisplayStart + 1;
                        },
                    },
                    {
                        data: "nomor_mou",
                        render: (data, type, row, meta) => {
                            return `
                                    <i class="bx bx-edit" style = "cursor: pointer;" nomor_mou = "${data}" kerja_sama_dengan = "${row.kerja_sama_dengan}" onclick = "Kegiatan.pilihDataMou(this)" ></i>
                                    `;
                        },
                    },
                    {
                        data: "file_mou",
                        render: (data, type, row, meta) => {
                            let badgeColorClass = row.status === 'AKTIF' ? 'bg-success' : 'bg-danger';
                            return `
                            ${row.file_mou}
                            <br>
                            <span class="badge ${badgeColorClass} badge-sm"> ${row.status}</span>
                                `;
                        },
                    },

                    {
                        data: "nomor_mou",
                    },
                    {
                        data: "kerja_sama_dengan",
                    },
                    {
                        data: "relevansi_prodi",
                        render: (data, type, row, meta) => {
                            return `
                            ${row.relevansi_prodi_mou.nama_prodi}
                            `;
                        },
                    },
                    {
                        data: "tanggal_dibuat",
                        render: (data, type, row, meta) => {
                            return `
                            ${row.tanggal_dibuat} <br>
                            s/d <br>
                            ${row.tanggal_berakhir}
                            `;
                        },
                    },
                    {
                        data: "id",
                        render: (data, type, row, meta) => {
                            return `
                            ${row.kategori_mou.nama_kategori} <br>
                            ${row.level_doc_mou.nama_level} <br>
                            ${row.jenis_mou.nama_jenis}
                            `;
                        },

                    },
                ],
            });
        }
    },

    pilihDataMou: (elm) => {
        let kerja_sama_dengan = $(elm).attr("kerja_sama_dengan");
        let nomor_mou = $(elm).attr("nomor_mou");
        $(`#nomor_mou`).val(`${nomor_mou} - ${kerja_sama_dengan}`);
        // Kegiatan.changeDataMou();
        message.closeDialog();
    },
    showDataMoa: (elm) => {
        let params = {};

        $.ajax({
            type: "POST",
            dataType: "html",
            data: params,
            url: url.base_url(Kegiatan.moduleApi()) + "showDataMoa",

            beforeSend: () => {
                message.loadingProses("Proses Pengambilan Data");
            },

            error: function () {
                message.closeLoading();
                Toast.error("Informasi", "Gagal");
            },

            success: function (resp) {
                message.closeLoading();
                bootbox.dialog({
                    message: resp,
                    size: "large",
                });
                Kegiatan.getDataMoa();
            },
        });
    },

    getDataMoa: async () => {
        let tableData = $("table#table-data");
        if (tableData.length > 0) {
            tableData.DataTable({
                processing: true,
                serverSide: true,
                ordering: true,
                autoWidth: false,
                order: [[0, "desc"]],
                aLengthMenu: [
                    [25, 50, 100],
                    [25, 50, 100],
                ],
                ajax: {
                    url:
                        url.base_url(Kegiatan.moduleApiDokumenMoa()) +
                        `getData`,
                    type: "POST",
                    // "headers": {
                    //     'X-CSRF-TOKEN': `'${tokenApi}'`
                    // }
                },
                deferRender: true,
                createdRow: function (row, data, dataIndex) {
                    // console.log('row', $(row));
                },
                columnDefs: [
                    {
                        targets: 5,
                        orderable: false,
                        createdCell: function (
                            td,
                            cellData,
                            rowData,
                            row,
                            col
                        ) {
                            // $(td).addClass("td-padd");
                        },
                    },
                    {
                        targets: 2,
                        orderable: true,
                        createdCell: function (
                            td,
                            cellData,
                            rowData,
                            row,
                            col
                        ) {
                            // $(td).addClass('td-padd');
                        },
                    },
                    {
                        targets: [0, 1],
                        orderable: false,
                        createdCell: function (
                            td,
                            cellData,
                            rowData,
                            row,
                            col
                        ) {
                            $(td).addClass("td-padd");
                            $(td).addClass("text-center");
                        },
                    },
                    {
                        targets: 0,
                        createdCell: function (
                            td,
                            cellData,
                            rowData,
                            row,
                            col
                        ) {
                            // $(td).addClass('td-padd');
                        },
                    },
                ],
                columns: [
                    {
                        data: "id",
                        render: function (data, type, row, meta) {
                            return meta.row + meta.settings._iDisplayStart + 1;
                        },
                    },
                    {
                        data: "nomor_moa",
                        render: (data, type, row, meta) => {
                            return `
                                    <i class="bx bx-edit" style = "cursor: pointer;" nomor_moa = "${data}" kerja_sama_dengan = "${row.kerja_sama_dengan}" onclick = "Kegiatan.pilihDataMoa(this)" ></i>
                                `;
                        },
                    },
                    {
                        data: "file_moa",
                        render: (data, type, row, meta) => {
                            let badgeColorClass = row.status === 'AKTIF' ? 'bg-success' : 'bg-danger';
                            return `
                            ${row.file_moa}
                            <br>
                            <span class="badge ${badgeColorClass} badge-sm"> ${row.status}</span>
                                `;
                        },
                    },

                    {
                        data: "nomor_mou",
                    },

                    {
                        data: "nomor_moa",
                    },
                    {
                        data: "kerja_sama_dengan",
                        render: (data, type, row, meta) => {
                            return `
                            ${row.kerja_sama_dengan}
                            `;
                        },
                    },
                    {
                        data: "relevansi_prodi",
                        render: (data, type, row, meta) => {
                            return `
                            ${row.relevansi_prodi_moa.nama_prodi}
                            `;
                        },
                    },
                    {
                        data: "tanggal_dibuat",
                        render: (data, type, row, meta) => {
                            return `
                            ${row.tanggal_dibuat} <br>
                            s/d <br>
                            ${row.tanggal_berakhir}
                            `;
                        },
                    },
                    {
                        data: "id",
                        render: (data, type, row, meta) => {
                            return `
                            ${row.kategori_moa.nama_kategori} <br>
                            ${row.level_doc_moa.nama_level} <br>
                            ${row.jenis_moa.nama_jenis}
                            `;
                        },

                    },
                ],
            });
        }
    },

    pilihDataMoa: (elm) => {
        let kerja_sama_dengan = $(elm).attr("kerja_sama_dengan");
        let nomor_moa = $(elm).attr("nomor_moa");
        $(`#nomor_moa`).val(`${nomor_moa} - ${kerja_sama_dengan}`);
        // Kegiatan.changeDataMoa();
        message.closeDialog();
    },

    addLampiran: (elm, e) => {
        e.preventDefault();
        let tbody = $(elm).closest('tbody');
        let html = `<tr class="input" data_id="">
            <td>
                <div class="input-group">
                    <button class="btn btn-outline-primary" type="button" id="button-addon1" onclick="Kegiatan.addFile(this)">Pilih</button>
                    <input id="file" type="text" readonly class="form-control required" error="File" placeholder="Pilih Data File" aria-label="Pilih Data File" aria-describedby="button-addon1" value="">
                </div>
            </td>
            <td>
                <textarea name="keterangan" id="keterangan" class="form-control" cols="30" rows="5" placeholder="keterangan"></textarea>
            </td>
            <td>
                <i class="bx bx-trash" style="cursor: pointer;" onclick="Kegiatan.deleteItem(this, event)"></i>
            </td>
        </tr>`;
        tbody.prepend(html);
    },

    addFile: (elm) => {
        var uploader = $('<input type="file" accept="image/*;capture=camera" />');
        var src_foto = $(elm).closest('tr').find('#file');
        uploader.click();

        uploader.on("change", function () {
            var reader = new FileReader();
            reader.onload = function (event) {
                var files = $(uploader).get(0).files[0];
                filename = files.name;
                var data_from_file = filename.split(".");
                var type_file = $.trim(data_from_file[data_from_file.length - 1]);
                if (type_file == 'jpg' || type_file == 'jpeg' || type_file == 'png' || type_file == 'JPG' || type_file == 'JPEG' || type_file == 'PNG' || type_file == 'pdf') {
                    var data = event.target.result;
                    src_foto.attr("src", data);
                    src_foto.attr("tipe", type_file);
                    src_foto.val(filename);
                } else {
                    bootbox.dialog({
                        message: "File Harus Berupa Gambar Bertipe JPG, JPEG, PNG, PDF"
                    });
                }
            };

            reader.readAsDataURL(uploader[0].files[0]);
        });
    },

    deleteItem: (elm, e) => {
        let id = $(elm).closest('tr').attr('data_id');
        if (id == '') {
            $(elm).closest('tr').remove();
        } else {
            $(elm).closest('tr').addClass('hide');
            $(elm).closest('tr').addClass('remove');
        }
    },

    showFile: (elm, e) => {
        e.preventDefault();

        let file = $(elm).attr('src');
        try {

            if (file.search('.png') > -1) {
                image = true;
            } else if (file.search('.jpg') > -1) {
                image = true;
            } else if (file.search('.jpeg') > -1) {
                image = true;
            } else {
                image = false;
            }

            let html = ``;

            if (image) {
                html = `<div class="row g-3">
                    <div class="col-12">
                        <div style="overflow: auto">
                            <img id="image-pembelian" src="${file}" width="100%"/>
                        </div>
                        <div class="text-center">
                            <button onclick="Kegiatan.imageZoomIn('#image-pembelian')" class="btn btn-primary">Zoom In</button>
                            <button onclick="Kegiatan.imageZoomOut('#image-pembelian')" class="btn btn-danger">Zoom Out</button>
                        </div>
                    </div>
                </div>`;
            } else {
                html = `<div class="row g-3">
                    <div class="col-12">
                        <br/>
                        <iframe id="frame" src="${file}" width="100%" height="800"/>
                    </div>
                </div>`;
            }

            bootbox.dialog({
                message: html,
                size: 'large',
                onEscape: true,
            });


        } catch (error) {
            alert('Gagal Mengakses File')
        }

    },


    zoomInit: 100,

    imageZoomIn: (elm) => {

        if (Kegiatan.zoomInit != 300) {
            Kegiatan.zoomInit = Kegiatan.zoomInit + 50
        }

        $(elm).css({
            "margin": "auto",
            "width": `${Kegiatan.zoomInit}%`,
        })

        console.log(Kegiatan.zoomInit)
    },

    imageZoomOut: (elm) => {

        if (Kegiatan.zoomInit != 50) {
            Kegiatan.zoomInit = Kegiatan.zoomInit - 50
        }

        $(elm).css({
            "margin": "auto",
            "width": `${Kegiatan.zoomInit}%`,
        })

        console.log(Kegiatan.zoomInit)
    },


    getPostdataLampiran: () => {
        let data = [];
        let tableData = $('table#table-lampiran').find('tbody').find('tr.input');
        $.each(tableData, function () {
            let tr = $(this);
            let params = {};
            params.id = tr.attr('data_id');
            params.file = tr.find('input#file').attr('src');
            params.tipe = tr.find('input#file').attr('tipe');
            params.keterangan = tr.find('#keterangan').val();
            data.push(params);
        });

        return data;
    },
    imageZoomOut: (elm) => {

        if (Kegiatan.zoomInit != 50) {
            Kegiatan.zoomInit = Kegiatan.zoomInit - 50
        }

        $(elm).css({
            "margin": "auto",
            "width": `${Kegiatan.zoomInit}%`,
        })

        console.log(Kegiatan.zoomInit)
    },

    changeDataMou: () => {
        let input_nomor_mou = $('#nomor_mou');
        let changeEventTriggered = false;
        let numericPart
        // Attach a handler to the 'change' event
        $(input_nomor_mou).on('change', function () {
            nomor_mou = input_nomor_mou.val();
            numericPart = nomor_mou.replace(/\D/g, '');
            changeEventTriggered = true;
        });

        // Trigger the 'change' event
        $(input_nomor_mou).trigger('change');

        // Check if the 'change' event has been triggered
        if (changeEventTriggered) {
            Kegiatan.getDataMoa(numericPart);
        } else {
            bootbox.dialog({
                message: "Data Gagal Di Trigger"
            });
        }
    },
    changeDataMoa: () => {
        let input_nomor_mou = $('#nomor_moa');
        let changeEventTriggered = false;
        let numericPart
        // Attach a handler to the 'change' event
        $(input_nomor_moa).on('change', function () {
            nomor_moa = input_nomor_moa.val();
            numericPart = nomor_moa.replace(/\D/g, '');
            changeEventTriggered = true;
        });

        // Trigger the 'change' event
        $(input_nomor_moa).trigger('change');

        // Check if the 'change' event has been triggered
        if (changeEventTriggered) {
            Kegiatan.getDataMoa(numericPart);
        } else {
            bootbox.dialog({
                message: "Data Gagal Di Trigger"
            });
        }
    },





};

$(function () {
    Kegiatan.getData();
    Kegiatan.setTextEditor();
    Kegiatan.setDate();
    Kegiatan.select2All();

});
