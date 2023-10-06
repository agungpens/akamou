
let PengajuanPrePR = {
    module: () => {
        return "purchasing/pengajuan-pre-pr";
    },

    moduleApi: () => {
        return `api/${PengajuanPrePR.module()}`;
    },

    add: () => {
        window.location.href = url.base_url(PengajuanPrePR.module()) + "add?tipe=DOCT_PRE_PR";
    },

    addDoc: (elm, e) => {
        e.preventDefault();
        let tipe = $(elm).attr('tipe');
        window.location.href = url.base_url(PengajuanPrePR.module()) + "add?tipe=" + tipe;
    },

    ubah: (elm) => {
        let data_id = $(elm).attr("data_id");
        window.location.href = url.base_url(PengajuanPrePR.module()) + "ubah?id=" + data_id;
    },

    detail: (elm) => {
        let data_id = $(elm).attr("data_id");
        window.location.href = url.base_url(PengajuanPrePR.module()) + "detail?id=" + data_id;
    },

    back: () => {
        window.location.href = url.base_url(PengajuanPrePR.module()) + "index";
    },

    ajukanPR: (elm) => {
        let data_id = $(elm).attr("data_id");
        window.location.href = url.base_url("purchasing/permintaan-pembelian") + "add?tipe=DOCT_PR&pre_pr_id=" + data_id;
    },

    getData: async () => {
        let tableData = $('table#table-data');
        tableData.DataTable().destroy();

        let params = {}

        if (tableData.length > 0) {
            let updateAction = $('#update').val();
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
                    "url": url.base_url(PengajuanPrePR.moduleApi()) + `getData`,
                    "type": "POST",
                    "data": params,
                },
                "deferRender": true,
                "createdRow": function (row, data, dataIndex) {
                },
                "columnDefs": [
                    {
                        "targets": [0, 4, 5, 6],
                        "orderable": false,
                    },
                    {
                        "targets": 0,
                        "createdCell": function (td, cellData, rowData, row, col) {
                            $(td).addClass('text-center');
                        }
                    },
                ],
                "columns": [
                    {
                        "data": "id",
                        "render": (data, type, row, meta) => {
                            let htmlAction = '';
                            if (updateAction == '1') {
                                htmlAction += `<button class="btn btn-warning" data_id="${data}" onclick="PengajuanPrePR.detail(this)"><i class="fa fa-eye"></i></button>`;
                            }
                            return htmlAction;
                        }
                    },
                    {
                        "data": "id",
                        render: function (data, type, row, meta) {
                            return meta.row + meta.settings._iDisplayStart + 1;
                        }
                    },
                    {
                        "data": "kode",
                    },
                    {
                        "data": "jenis",
                    },
                    {
                        "data": "tanggal_efektif",
                        "render": function (data, type, row, meta) {
                            return `${row.tanggal_efektif} s/d ${row.tanggal_efektif_sampai}`;
                        }
                    },
                    {
                        "data": "nama_departemen",
                        "render": function (data, type, row, meta) {
                            return `${row.nama_departemen} <br> ${row.area}`;
                        }
                    },
                    {
                        "data": "purpose",
                    },
                    {
                        "data": "tanggal_pengajuan",
                    },
                    {
                        "data": "approver",
                    },

                ],
            });
        }
    },


    getDataLaporan: async () => {
        let tableData = $('table#table-data-laporan-pengajuan-perjalanan-dinas');
        tableData.DataTable().destroy();

        let params = {};

        params.status = $("#status").val()
        params.departemen = $("#cb-departemen").val()
        params.area = $("#cb-area-kerja").val()
        params.nik = $.trim($('#nik').val())
        params.tgl_mulai = $.trim($('#tgl_mulai').val())
        params.tgl_selesai = $.trim($('#tgl_selesai').val())

        if (tableData.length > 0) {
            let updateAction = $('#update').val();
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
                    "url": url.base_url(PengajuanPrePR.moduleApi()) + `getDataLaporan`,
                    "type": "POST",
                    "data": params,
                },
                "deferRender": true,
                "createdRow": function (row, data, dataIndex) {
                },
                "columnDefs": [
                    {
                        "targets": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
                        "orderable": false,
                    },
                    {
                        "targets": 0,
                        "createdCell": function (td, cellData, rowData, row, col) {
                            $(td).addClass('text-center');
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
                        "data": "kode",
                        "render": function (data, type, row, meta) {
                            return `<a href="javascript:;" data_id="${row.header_id_perdin}" onclick="PengajuanPrePR.detail(this)">${row.kode}</a>`;
                        }
                    },
                    {
                        "data": "tanggal_efektif",
                    },
                    {
                        "data": "tanggal_efektif_sampai",
                    },
                    {
                        "data": "nama_departemen",
                        "render": function (data, type, row, meta) {
                            return `${row.nama_departemen} <br> ${row.area}`;
                        }
                    },
                    {
                        "data": "pic_perdin",
                    },
                    {
                        "data": "item_name",
                        "render": function (data, type, row, meta) {
                            var item = row.item_name.split(' untuk ');

                            return item[0];
                        }
                    },
                    {
                        "data": "lokasi",
                    },
                    {
                        "data": "catatan",
                    },
                    {
                        "data": "purpose",
                    },
                    {
                        "data": "pr_no",
                        "render": function (data, type, row, meta) {
                            if (row.pr_no) {
                                return '<span class="badge bg-success">SUDAH</span>';
                            } else {
                                return '<span class="badge bg-warning">BELUM</span>';
                            }
                        }
                    },
                    {
                        "data": "pr_no",
                    },
                    {
                        "data": "tipe",
                    },
                    {
                        "data": "requestor_pr",
                    },
                    {
                        "data": "status_pr",
                        "render": (data, type, row, meta) => {
                            if (row.status_acc_pr == '' || row.status_pr == 'CREATED') {
                                return `<span class="badge bg-label-warning">Menunggu Proses Approval Manajer Departemen</span>`;
                            }
                            if (row.status_acc_pr == null && data == 'APPROVED') {
                                return `<span class="badge bg-label-warning">Menunggu Proses Verifikasi Admin MOI</span>`;
                            }
                            if (row.status_acc_pr == 'RT_ACCESS_ACC_1' && data == 'APPROVED') {
                                return `<span class="badge bg-label-warning">Menunggu Proses Verifikasi Admin MOI</span>`;
                            }
                            if (row.status_acc_pr == 'RT_ACCESS_ACC_1' && data == 'REJECTED') {
                                return `<span class="badge bg-label-danger">Pengajuan Ditolak oleh Manajer Departemen</span>`;
                            }
                            if (row.status_acc_pr == 'RT_ACCESS_ACC_2' && data == 'APPROVED') {
                                return `<span class="badge bg-label-warning">Menunggu Proses Approval Manajer Purchasing</span>`;
                            }
                            if (row.status_acc_pr == 'RT_ACCESS_ACC_2' && data == 'REJECTED') {
                                return `<span class="badge bg-label-danger">Pengajuan Ditolak oleh Admin MOI</span>`;
                            }
                            if (row.status_acc_pr == 'RT_ACCESS_ACC_3' && data == 'APPROVED') {
                                return `<span class="badge bg-label-info">Menunggu Proses Approval Direksi</span>`;
                            }
                            if (row.status_acc_pr == 'RT_ACCESS_ACC_3' && data == 'REJECTED') {
                                return `<span class="badge bg-label-danger">Pengajuan Ditolak oleh Manajer Purchasing</span>`;
                            }
                            if (row.status_acc_pr == 'RT_ACCESS_ACC_4' && data == 'APPROVED') {
                                return `<span class="badge bg-label-success">Pengajuan Diacc oleh Direksi</span>`;
                            }
                            if (row.status_acc_pr == 'RT_ACCESS_ACC_4' && data == 'REJECTED') {
                                return `<span class="badge bg-label-danger">Pengajuan Ditolak oleh Direksi</span>`;
                            }
                            return "";
                        }
                    },

                ],
                dom:
                    '<"row mx-2"' +
                    '<"col-md-2"<"me-3"l>>' +
                    '<"col-md-10"<"dt-action-buttons text-xl-end text-lg-start text-md-end text-start d-flex align-items-center justify-content-end flex-md-row flex-column mb-3 mb-md-0"fB>>' +
                    '>t' +
                    '<"row mx-2"' +
                    '<"col-sm-12 col-md-6"i>' +
                    '<"col-sm-12 col-md-6"p>' +
                    '>',
                'buttons': [
                    {
                        extend: 'collection',
                        className: 'btn btn-label-secondary dropdown-toggle mx-3',
                        text: '<i class="bx bx-upload me-2"></i>Export',
                        buttons: [
                            {
                                extend: 'excel',
                                text: '<i class="bx bx-file me-2" ></i>Excel',
                                className: 'dropdown-item',
                                //   exportOptions: { columns: [2, 3, 4, 5] }
                            },
                        ]
                    },
                ],
                scrollY:        "700px",
                scrollX:        true,
                scrollCollapse: true,
                fixedColumns:   {
                    leftColumns: 2,
                    //rightColums:1
                }
            });
        }
    },

    delete: (elm, e) => {
        e.preventDefault();
        let data_id = $(elm).attr('data_id');
        let html = `<div class="row g-3">
        <div class="col-12">
        <hr/>
        </div>
        <div class="col-12 text-center">
            <p>Apakah anda yakin akan menghapus data ini ?</p>
        </div>
        <div class="col-12 text-center">
            <br/>
            <button class="btn btn-primary btn-sm" onclick="PengajuanPrePR.deleteConfirm(this, '${data_id}')">Ya</button>
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
            url: url.base_url(PengajuanPrePR.moduleApi()) + "delete",

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

    getPostInputDokumen: () => {
        let params = {};
        let data_file = $('div.content-file-upload');
        $.each(data_file, function () {
            let $this = $(this);
            let attr_obj_img = $this.find('img').attr('id');
            let attr_obj_filename = $this.find('label').attr('id');
            params[`${attr_obj_img.replaceAll('-', '_')}`] = $this.find('img').attr('src');
            params[`${attr_obj_filename.replaceAll('-', '_')}`] = $this.find('label').text().trim();
        });

        return params;
    },

    nikTemp: [], // untuk pengecekan pengajuan nama sama

    getPostdataItem: () => {
        PengajuanPrePR.nikTemp = [];
        let akses = $('#pre_pr_akses').val()
        let data = [];
        let tableData = $('table#table-data-item').find('tbody').find('tr.input');
        $.each(tableData, function () {
            let tr = $(this);
            let params = {};
            let _nama_item;

            let nik = tr.find('input#bj_nik').val();
            let kode_item = $('#kodeItem').val();
            let kode_item_array = $('#kodeItem').val().split(' - ');
            let nama_item = $('#kodeItem_nama_item').val().split(' - ');
            let area = tr.find('input#area').val().split(' - ');

            if (akses == 'admin pre pr mdp kandidat') {
                _nama_item = `${nama_item[1]} (${kode_item_array[1]}) untuk ${nik}`;

                params.nama_item = _nama_item;
            } else {
                let bj_nik = nik.split(' - ');
                _nama_item = `${nama_item[1]} (${kode_item_array[1]}) untuk ${bj_nik[0]} ${bj_nik[1]}`;

                params.nama_item = _nama_item;
                params.nik = bj_nik[0];
            }

            PengajuanPrePR.nikTemp.push(_nama_item);

            params.id = tr.attr('data_id');
            params.area = area[0];
            params.kode_item = nama_item[0];
            params.jenis = kode_item;
            params.jumlah = tr.find('input#jumlah').val();
            // params.est_biaya  = tr.find('input#est_biaya').val();
            params.satuan = tr.find('input#satuan').val();
            params.remarks = tr.find('input#remarks').val();
            params.file = tr.find('input#file').attr('src');
            params.tipe = tr.find('input#file').attr('tipe');

            data.push(params);
        });

        return data;
    },

    getPostdataLampiran: () => {
        let data = [];
        let tableData = $('table#table-data-file').find('tbody').find('tr.input');
        $.each(tableData, function () {
            let tr = $(this);
            let params = {};
            params.file = tr.find('input#file').attr('src');
            params.tipe = tr.find('input#file').attr('tipe');
            data.push(params);
        });

        return data;
    },

    getPostData: () => {
        let data = {
            'data': {
                'id': $('input#id').val(),
                'tipe': $.trim($('#tipe').val()),
                'purpose': $.trim($('#purpose').val()),
                'spec': $.trim($('#spec').val()),
                'departemen': $.trim($('#departemen').val()),
                'area_kerja': $.trim($('#area_kerja').val()),
                'jenis': $.trim($('#kodeItem').val()),
                'item': $.trim($('#kodeItem_nama_item').val()),
                'tgl_efektif': $.trim($('#tgl_efektif').val()),
                'tgl_efektif_sampai': $.trim($('#tgl_efektif_sampai').val()),
            },
            'data_item': PengajuanPrePR.getPostdataItem(),
            'data_lampiran': PengajuanPrePR.getPostdataLampiran(),
        };

        return data;
    },

    getPostUpdate: () => {
        let data = {
            'data': {
                'id': $('input#id').val(),
            },
            'data_item': PengajuanPrePR.getPostdataItem(),
            'data_lampiran': PengajuanPrePR.getPostdataLampiran(),
        };

        return data;
    },

    submit: (elm, e) => {
        e.preventDefault();
        let params = PengajuanPrePR.getPostData(tipe);
        let form = $(elm).closest('div.form-pre-pr');
        if (params.data_item.length == 0) {
            Toast.error('Informasi', 'Item Harus Diisi');
            return;
        }
        if (params.data_lampiran.length == 0) {
            Toast.error('Informasi', 'Lampiran Harus Diisi');
            return;
        }

        if (PengajuanPrePR.hasDuplicates(PengajuanPrePR.nikTemp)) {
            Toast.error('Informasi', 'Mohon diperiksa Terdapat Duplikasi Item');
            return;
        }

        if (validation.runWithElement(form)) {
            // return;
            $.ajax({
                type: 'POST',
                dataType: 'json',
                data: params,
                url: url.base_url(PengajuanPrePR.moduleApi()) + "submit",
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

    update: (elm, e) => {
        e.preventDefault();
        let params = PengajuanPrePR.getPostUpdate();
        let form = $(elm).closest('div.form-pre-pr');
        if (params.data_item.length == 0) {
            Toast.error('Informasi', 'Item Harus Diisi');
            return;
        }

        // if (params.data_lampiran.length == 0) {
        //     Toast.error('Informasi', 'Lampiran Harus Diisi');
        //     return;
        // }

        if (PengajuanPrePR.hasDuplicates(PengajuanPrePR.nikTemp)) {
            Toast.error('Informasi', 'Mohon diperiksa Terdapat Duplikasi Item');
            return;
        }

        if (validation.runWithElement(form)) {
            // return;
            $.ajax({
                type: 'POST',
                dataType: 'json',
                data: params,
                url: url.base_url(PengajuanPrePR.moduleApi()) + "update",
                beforeSend: () => {
                    message.loadingProses('Proses Update Data...');
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

    setDate: () => {
        // const flatpickrRange = document.querySelector('.flatpickr');
        // if (flatpickrRange) {
        //     flatpickrRange.flatpickr();
        // }
        $('#tgl_efektif').flatpickr();
        $('#tgl_efektif_sampai').flatpickr();

        const flatpickrRange1 = document.querySelector('.flatpickr1');
        if (flatpickrRange1) {
            flatpickrRange1.flatpickr();
        }
        const flatpickrRange2 = document.querySelector('.flatpickr2');
        if (flatpickrRange2) {
            flatpickrRange2.flatpickr();
        }
    },

    select2All: () => {
        // Default
        const select2 = $('.select2');
        if (select2.length) {
            select2.each(function () {
                var $this = $(this);
                $this.wrap('<div class="position-relative"></div>').select2({
                    placeholder: 'Select value',
                    dropdownParent: $this.parent()
                });
            });
        }
    },

    takePict: (elm, e) => {
        e.preventDefault();
        let idcontent = $(elm).attr('data-id');
        var uploader = $('<input type="file" accept="image/*;capture=camera" />');
        var src_foto = $(`#${idcontent}`);
        uploader.click();

        uploader.on("change", function () {
            var reader = new FileReader();
            reader.onload = function (event) {
                var files = $(uploader).get(0).files[0];
                filename = files.name;
                var data_from_file = filename.split(".");
                var type_file = $.trim(data_from_file[data_from_file.length - 1]);
                if (type_file == 'jpg' || type_file == 'jpeg' || type_file == 'png') {
                    $(`#filename-${idcontent}`).text(filename);
                    process_image(files).then(function (response) {
                        src_foto.attr("src", response);
                    });
                    src_foto.closest('div').removeClass("hide");
                } else {
                    bootbox.dialog({
                        message: "File Harus Berupa Gambar Bertipe JPG, JPEG, PNG"
                    });

                }
            };

            reader.readAsDataURL(uploader[0].files[0]);
        });
    },

    getDataLogKaryawan: async () => {
        let tableData = $('table#table-data-log-karyawan');

        let params = {};
        params.nik = $('#id').val();
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
                    "url": url.base_url(PengajuanPrePR.moduleApi()) + `getDataLogKaryawan`,
                    "type": "GET",
                    "data": params
                    // "headers": {
                    //     'X-CSRF-TOKEN': `'${tokenApi}'`
                    // }
                },
                "deferRender": true,
                "createdRow": function (row, data, dataIndex) {
                    // console.log('row', $(row));
                },
                "columnDefs": [{
                    "targets": 4,
                    "orderable": false,
                    "createdCell": function (td, cellData, rowData, row, col) {
                        $(td).addClass('text-center');
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
                    "targets": 3,
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
                    }
                },
                {
                    "targets": 0,
                    "createdCell": function (td, cellData, rowData, row, col) {
                        $(td).addClass('td-padd');
                        $(td).addClass('text-center');
                    }
                },
                ],
                "columns": [{
                    "data": "nik",
                    render: function (data, type, row, meta) {
                        return meta.row + meta.settings._iDisplayStart + 1;
                    }
                },
                {
                    "data": "doc_trans",
                    "render": (data, type, row, meta) => {
                        return `<a class="" style="cursor: pointer;" onclick="PengajuanPrePR.showDetailEditProfile(this, event)">${data}</a>`;
                    }
                },
                {
                    "data": "tgl_pengajuan",
                },
                {
                    "data": "lpp_id",
                    "render": (data, type, row, meta) => {
                        if (row.tgl_verifikasi != '' && row.status == 'approved') {
                            return `<label class="text-success">Terverifikasi</label>`;
                        } else {
                            if (row.status == 'reject') {
                                return `<label class="text-danger">Ditolak</label>`;
                            } else {
                                if (row.tgl_approve == '') {
                                    return `<label class="text-primary">Proses Approval Perubahan</label>`;
                                } else {
                                    return `<label class="">Proses Verifikasi</label>`;
                                }
                            }
                        }
                    }
                },
                {
                    "data": "lpp_id",
                    "render": (data, type, row, meta) => {
                        return `
                            <i class="bx bx-edit" style="cursor: pointer;" data_id="${data}" onclick="PengajuanPrePR.detailPerubahan(this)"></i>`;
                    }
                }
                ]
            });
        }
    },

    modulePerubahan: () => {
        return "transaksi/perubahandatakaryawan";
    },

    modulePerubahanApi: () => {
        return `api/${PengajuanPrePR.modulePerubahan()}`;
    },

    detailPerubahan: (elm) => {
        let data_id = $(elm).attr("data_id");
        let from_id = $('input#id').val();
        window.location.href = url.base_url(PengajuanPrePR.modulePerubahan()) + "ubah?id=" + data_id + "&state=karyawan-" + from_id;
    },

    showDetailEditProfile: (elm, e) => {
        e.preventDefault();
        let params = {};
        params.no_pengajuan = $(elm).text().trim();

        $.ajax({
            type: 'POST',
            dataType: 'html',
            data: params,
            url: url.base_url(PengajuanPrePR.modulePerubahanApi()) + "showDetailEditProfile",

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
            }
        });
    },

    index: 0,

    addItem: (elm, e) => {
        let akses = $('#pre_pr_akses').val()
        let i = PengajuanPrePR.index

        e.preventDefault();
        let tbody = $(elm).closest('tbody');
        let html = ``;

        if (akses == 'admin pre pr mdp kandidat') {
            html = `<tr class="input" data_id="">
                            <td>
                                <div class="input-group">
                                    <input id="bj_nik" type="text" class="bj_nik${i} form-control required" error="Kandidat" placeholder="Masukan Nama Kandidat" aria-label="Masukan Nama Kandidat">
                                </div>
                    </td>`;
        } else {
            html = `<tr class="input" data_id="">
                        <td>
                            <div class="input-group">
                                <button class="btn btn-outline-primary" type="button" id="button-addon1" onclick="PengajuanPrePR.showDataKaryawan(this,'bj_nik${i}')">Pilih</button>
                                <input id="bj_nik" type="text" class="bj_nik${i} bj_nik form-control required" error="Karyawan" placeholder="Pilih Data Karyawan" aria-label="Pilih Data Karyawan">
                            </div>
                    </td>`;
        }

        html += `
            <td>
                <div class="input-group">
                    <button class="btn btn-outline-primary" type="button" id="button-addon1" onclick="PengajuanPrePR.showDataArea(this,'area${i}')">Pilih</button>
                    <input id="area" type="text" class="area${i} form-control required" error="Area" placeholder="Pilih Data Area" aria-label="Pilih Data Area">
                </div>
            </td>
            <td>
                <input type="number" id="jumlah" name="jumlah" class="form-control required"
                placeholder="Jumlah" error="Jumlah" value="1" readonly/>
                <br>
                <input type="text" id="satuan" name="satuan" class="form-control required"
                placeholder="Satuan" error="Satuan" value=""/>
            </td>
            <td>
                <input type="text" id="remarks" name="remarks" class="form-control required"
                placeholder="Keterangan" error="Keterangan" value=""/>
            </td>
            <td>
                <div class="input-group">
                    <button class="btn btn-outline-primary" type="button" id="button-addon1" onclick="PengajuanPrePR.addFile(this)">Pilih</button>
                    <input id="file" type="text" readonly class="form-control required" error="File" placeholder="Pilih Data File" aria-label="Pilih Data File" aria-describedby="button-addon1" value="">
                </div>
            </td>
            <td>
                <i class="bx bx-trash" style="cursor: pointer;" onclick="PengajuanPrePR.deleteItem(this, event)"></i>
            </td>
        </tr>`;
        tbody.prepend(html);

        PengajuanPrePR.index++;
    },

    addLampiran: (elm, e) => {
        e.preventDefault();
        let tbody = $(elm).closest('tbody');
        let html = `<tr class="input" data_id="">
            <td>
                <div class="input-group">
                    <button class="btn btn-outline-primary" type="button" id="button-addon1" onclick="PengajuanPrePR.addFile(this)">Pilih</button>
                    <input id="file" type="text" readonly class="form-control" error="File" placeholder="Pilih Data File" aria-label="Pilih Data File" aria-describedby="button-addon1" value="">
                </div>
            </td>
            <td>
                <i class="bx bx-trash" style="cursor: pointer;" onclick="PengajuanPrePR.deleteItem(this, event)"></i>
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
        // let file = 'http://localhost/simi/public/assets/img/LOGOMOTASA.png';
        // let html = `<div class="row g-3">
        //     <div class="col-12">
        //         <br/>
        //         <embed id="frame" src="${file}" width="800" height="800"/>
        //     </div>
        // </div>`;

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
                            <button onclick="PengajuanPrePR.imageZoomIn('#image-pembelian')" class="btn btn-primary">Zoom In</button>
                            <button onclick="PengajuanPrePR.imageZoomOut('#image-pembelian')" class="btn btn-danger">Zoom Out</button>
                        </div>
                    </div>
                </div>`;
            } else {
                html = `<div class="row g-3">
                    <div class="col-12">
                        <br/>
                        <iframe id="frame" src="${file}" width="800" height="800"/>
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

        if (PengajuanPrePR.zoomInit != 300) {
            PengajuanPrePR.zoomInit = PengajuanPrePR.zoomInit + 50
        }

        $(elm).css({
            "margin": "auto",
            "width": `${PengajuanPrePR.zoomInit}%`,
        })

        console.log(PengajuanPrePR.zoomInit)
    },

    imageZoomOut: (elm) => {

        if (PengajuanPrePR.zoomInit != 50) {
            PengajuanPrePR.zoomInit = PengajuanPrePR.zoomInit - 50
        }

        $(elm).css({
            "margin": "auto",
            "width": `${PengajuanPrePR.zoomInit}%`,
        })

        console.log(PengajuanPrePR.zoomInit)
    },

    ExportData: (elm) => {
        let idExportContent = $(elm).attr('idexport');
        window.open('data:application/vnd.ms-excel,' + encodeURIComponent($(`div#${idExportContent}`).html()));
    },

    setStatusBarang: (elm) => {
        let status = $(elm).val();
        let data_id = $(elm).closest('tr').attr('data_id');
        if (status == '0') {
            PengajuanPrePR.barangDitolak(elm);
        } else if (status == '1') {
            PengajuanPrePR.barangReceived(elm);
        }
    },

    barangReceived: (elm) => {
        let data_id = $(elm).closest('tr').attr('data_id');
        let table = $('table#table-data-item').find('tbody').find(`tr#input-${data_id}`);
        let ket = '';
        table.find('#keterangan-barang').text(ket);
        // table.find('#keterangan-barang').closest('div').addClass('hide');
    },

    barangReceivedPop: (elm, data_id) => {
        let table = $('table#table-data-item').find('tbody').find(`tr#input-${data_id}`);
        let ket = '';
        table.find('#keterangan-barang').text(ket);
        if (!table.find('#keterangan-barang').closest('div').hasClass('hide')) {
            table.find('#keterangan-barang').closest('div').addClass('hide');
        }
        table.find('#status_barang').val('1');
        console.log(`table.find('#status_barang')`, table.find('#status_barang'));
        message.closeDialog();
    },

    barangDitolak: (elm) => {
        let data_id = $(elm).closest('tr').attr('data_id');
        let html = `<div class="row g-3">
        <div class="col-12">
            <br/>
            <label class="form-label" for="alasan">Keterangan</label>
            <textarea id="keterangan" name="keterangan" error="Keterangan" class="form-control required" rows="2" placeholder="Keterangan"></textarea>
        </div>
        <div class="col-12 text-end">
            <br/>
            <button class="btn btn-primary btn-sm" onclick="PengajuanPrePR.rejectBarang(this, '${data_id}')">Proses</button>
            <button class="btn btn-sm" onclick="PengajuanPrePR.barangReceivedPop(this, '${data_id}')">Batal</button>
        </div>
        </div>`;

        bootbox.dialog({
            message: html
        });

        $('.bootbox-close-button').addClass('btn-close').text("");
    },

    rejectBarang: (elm, data_id) => {
        let table = $('table#table-data-item').find('tbody').find(`tr#input-${data_id}`);
        let ket = $('#keterangan').val();
        table.find('#keterangan-barang').text(ket);
        table.find('#keterangan-barang').closest('div').removeClass('hide');
        message.closeDialog();
    },

    // get requester
    showDataKaryawan: (elm, id_text) => {

        let params = {};
        $.ajax({
            type: 'POST',
            dataType: 'html',
            data: params,
            url: url.base_url(PengajuanPrePR.moduleApi()) + "showDataKaryawan",

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
                PengajuanPrePR.getDataKaryawan(id_text);
            }
        });

    },

    getDataKaryawan: async (bindText) => {
        let tableData = $('table#table-data-karyawan');
        let params = {};

        let prePrNIK = [];

        $.each($('.bj_nik'), function (i) {
            let kry = $(this).val();

            if (kry != '') {
                let nik = kry.split(' - ')[0];

                prePrNIK.push(nik);
            }
        });

        if (prePrNIK.length) {
            params.nik = prePrNIK
        }

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
                    [10, 20, 50],
                    [10, 20, 50]
                ],
                "ajax": {
                    "url": url.base_url('api/master/karyawan') + `getDataPrePR`,
                    "type": "POST",
                    "data": params
                },
                "deferRender": true,
                "createdRow": function (row, data, dataIndex) {
                },
                "columnDefs": [{
                    "targets": 3,
                    "orderable": false,
                    "createdCell": function (td, cellData, rowData, row, col) {
                        $(td).addClass('text-center');
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
                    }
                },
                {
                    "targets": 0,
                    "createdCell": function (td, cellData, rowData, row, col) {
                        $(td).addClass('td-padd');
                        $(td).addClass('text-center');
                    }
                },
                ],
                "columns": [{
                    "data": "nik",
                    render: function (data, type, row, meta) {
                        return meta.row + meta.settings._iDisplayStart + 1;
                    }
                },
                {
                    "data": "nik",
                },
                {
                    "data": "nama_lengkap",
                },
                {
                    "data": "nik",
                    "render": (data, type, row, meta) => {
                        return `<i class="bx bx-edit" style="cursor: pointer;" nama_lengkap="${row.nama_lengkap}" data_id="${data}" onclick="PengajuanPrePR.pilihData(this,'${bindText}')"></i>`;
                    }
                }
                ]
            });
        }
    },

    pilihData: (elm, bindID) => {
        let nama_lengkap = $(elm).attr('nama_lengkap');
        let nik = $(elm).attr('data_id');

        $('.' + bindID).val(nik + " - " + nama_lengkap);
        message.closeDialog();
    },

    // get area
    showDataArea: (elm, id_text) => {

        let params = {};
        $.ajax({
            type: 'POST',
            dataType: 'html',
            data: params,
            url: url.base_url(PengajuanPrePR.moduleApi()) + "showDataArea",

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
                PengajuanPrePR.getDataArea(id_text);
            }
        });

    },

    getDataArea: async (bindText) => {
        let tableData = $('table#table-data-area');
        let params = {};
        params.id = $('#id').val();
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
                    [200, 300, 1000],
                    [200, 300, 1000]
                ],
                "ajax": {
                    "url": url.base_url('api/purchasing/pengajuan-pre-pr') + `getDataArea`,
                    "type": "POST",
                    "data": params
                },
                "deferRender": true,
                "createdRow": function (row, data, dataIndex) {
                },
                "columnDefs": [{
                    "targets": 2,
                    "orderable": false,
                    "createdCell": function (td, cellData, rowData, row, col) {
                        $(td).addClass('text-center');
                        $(td).addClass('td-padd');
                        $(td).addClass('action');
                    }
                },
                {
                    "targets": 1,
                    "orderable": false,
                    "createdCell": function (td, cellData, rowData, row, col) {
                        $(td).addClass('td-padd');
                    }
                },
                {
                    "targets": 0,
                    "createdCell": function (td, cellData, rowData, row, col) {
                        $(td).addClass('td-padd');
                        $(td).addClass('text-center');
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
                    "data": "nama",
                },
                {
                    "data": "id",
                    "render": (data, type, row, meta) => {
                        return `<i class="bx bx-edit" style="cursor: pointer;" nama="${row.nama}" data_id="${data}" onclick="PengajuanPrePR.pilihDataArea(this,'${bindText}')"></i>`;
                    }
                }
                ]
            });
        }
    },

    pilihDataArea: (elm, bindID) => {
        let nama = $(elm).attr('nama');
        let id = $(elm).attr('data_id');
        $('.' + bindID).val(id + " - " + nama);
        message.closeDialog();
    },

    // get jenis
    showDataJenis: (elm, id_text) => {

        let params = {};
        $.ajax({
            type: 'POST',
            dataType: 'html',
            data: params,
            url: url.base_url(PengajuanPrePR.moduleApi()) + "showDataJenis",

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
                PengajuanPrePR.getDataJenis(id_text);
            }
        });

    },

    getDataJenis: async (bindText) => {
        let tableData = $('table#table-data-jenis');
        let params = {};
        params.id = $('#id').val();
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
                    [200, 300, 1000],
                    [200, 300, 1000]
                ],
                "ajax": {
                    "url": url.base_url('api/purchasing/pengajuan-pre-pr') + `getDataJenis`,
                    "type": "POST",
                    "data": params
                },
                "deferRender": true,
                "createdRow": function (row, data, dataIndex) {
                },
                "columnDefs": [{
                    "targets": 2,
                    "orderable": false,
                    "createdCell": function (td, cellData, rowData, row, col) {
                        $(td).addClass('text-center');
                        $(td).addClass('td-padd');
                        $(td).addClass('action');
                    }
                },
                {
                    "targets": 1,
                    "orderable": false,
                    "createdCell": function (td, cellData, rowData, row, col) {
                        $(td).addClass('td-padd');
                    }
                },
                {
                    "targets": 0,
                    "createdCell": function (td, cellData, rowData, row, col) {
                        $(td).addClass('td-padd');
                        $(td).addClass('text-center');
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
                    "data": "nama",
                },
                {
                    "data": "id",
                    "render": (data, type, row, meta) => {
                        return `<button class="btn btn-success" kode_item="${row.kode_item}" nama_item="${row.nama_item}" nama="${row.nama}" tipe="${row.tipe}" data_id="${data}" onclick="PengajuanPrePR.pilihDataJenis(this,'${bindText}')" ><i class="bx bx-edit"></i></button>`;
                    }
                }
                ]
            });
        }
    },

    pilihDataJenis: (elm, bindID) => {
        let nama = $(elm).attr('nama');
        let tipe = $(elm).attr('tipe');
        let kode_item = $(elm).attr('kode_item');
        let nama_item = $(elm).attr('nama_item');
        let id = $(elm).attr('data_id');
        $('#' + bindID).val(id + " - " + nama);
        $('#' + bindID + '_nama_item').val(kode_item + " - " + nama_item);
        message.closeDialog();
    },

    // get kode item
    showDataKodeItem: (elm, id_text) => {

        let params = {};
        $.ajax({
            type: 'GET',
            dataType: 'html',
            data: params,
            url: url.base_url(PengajuanPrePR.moduleApi()) + "getViewKodeItem",
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
                PengajuanPrePR.getDataKodeItem(id_text);
            }
        });

    },

    getDataKodeItem: async (bindText) => {
        let tableData = $('table#table-data-kodeitem');
        let params = {};
        params.id = $('#id').val();
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
                    [10, 50],
                    [10, 50]
                ],
                "ajax": {
                    "url": url.base_url(PengajuanPrePR.moduleApi()) + "getDataKodeItem",
                    "type": "POST",
                    "data": params
                },
                "deferRender": true,
                "createdRow": function (row, data, dataIndex) {
                },
                "columnDefs": [
                    {
                        "targets": [1, 2],
                        "orderable": false,
                    },
                    {
                        "targets": 3,
                        "orderable": false,
                        "createdCell": function (td, cellData, rowData, row, col) {
                            $(td).addClass('text-center');
                        }
                    },
                    {
                        "targets": 0,
                        "createdCell": function (td, cellData, rowData, row, col) {
                            $(td).addClass('text-center');
                        }
                    },
                ],
                "columns": [{
                    "data": "bid",
                    render: function (data, type, row, meta) {
                        return meta.row + meta.settings._iDisplayStart + 1;
                    }
                },
                {
                    "data": "bkode",
                },
                {
                    "data": "bnama",
                },
                {
                    "data": "bid",
                    "render": (data, type, row, meta) => {
                        return `<button class="btn btn-primary btn-sm" data-kode="${row.bkode}" data-nama="${row.bnama}" onclick="PengajuanPrePR.pilihDataKodeItem(this,'${bindText}')">Pilih</button>`;
                    }
                }
                ]
            });
        }
    },

    pilihDataKodeItem: (elm, bindID) => {
        let kode = $(elm).attr('data-kode');
        let nama = $(elm).attr('data-nama');
        $('#' + bindID).val(`${kode}`);
        $('.nama' + bindID).val(`${nama}`);
        message.closeDialog();
    },

    hasDuplicates: (array) => {
        var valuesSoFar = Object.create(null);
        for (var i = 0; i < array.length; ++i) {
            var value = array[i];
            if (value in valuesSoFar) {
                return true;
            }
            valuesSoFar[value] = true;
        }
        return false;
    }

};

$(function () {
    PengajuanPrePR.getData();
    if ($('table#table-data-laporan-pengajuan-perjalanan-dinas').length) {
        PengajuanPrePR.getDataLaporan();
    }
    PengajuanPrePR.getDataLogKaryawan();
    PengajuanPrePR.setDate();
    PengajuanPrePR.select2All();
});
