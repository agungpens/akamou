<input type="hidden" id="id" value="{{ isset($id) ? $id : '' }}">
<div class="row ">
    <div class="col-md-12 mb-3 text-end">
        <a href="#" class="dt-button create-new btn btn-secondary" tabindex="0" aria-controls="DataTables_Table_0"
            type="button" onclick="DokumenMoa.back()">
            <span>
                <i class="bx bx-chevron-left me-sm-2"></i>
                <span class="d-none d-sm-inline-block">Kembali</span>
            </span>
        </a>
    </div>

    <div class="col-xl-12">
        <div class="card">
            <h5 class="card-header">Detail Document Moa</h5>
            <div class="row form g-3">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">
                            <label class="form-label" for="basic-icon-default-fullname">Relevansi Dokumen MOU
                                (Optional)</label>
                            <div class="input-group mb-3">
                                <button class="btn btn-outline-primary" type="button" id="button-addon1"
                                    onclick="DokumenMoa.showDataMou(this, event)">Pilih</button>
                                <input id="nomor_mou" src="" type="text" class="form-control"
                                    placeholder="Pilih data dokumen mou" aria-label="Pilih data dokumen mou"
                                    aria-describedby="button-addon1"
                                    value="{{ isset($data->nomor_mou) ? $data->doc_mou->nomor_mou . ' - ' . $data->doc_mou->kerja_sama_dengan : '' }}"
                                    readonly>
                            </div>

                            <label class="form-label" for="basic-icon-default-fullname">
                                File MOA
                            </label>
                            <div class="input-group mb-3">
                                <button class="btn btn-outline-primary" type="button" id="button-addon1"
                                    onclick="DokumenMoa.addFileOutTable(this)">
                                    Pilih
                                </button>
                                <input id="file" type="text" class="form-control required" error="File MOA"
                                    placeholder="Pilih data dokumen mou" aria-label="Pilih data dokumen mou"
                                    aria-describedby="button-addon1"
                                    value="{{ isset($data->file_moa) ? $data->nomor_moa . ' - ' . $data->kerja_sama_dengan : '' }}"
                                    readonly>
                            </div>
                            <div class="text-end mb-2">
                                <button class="btn btn-success" type="button" id="button-addon1"
                                    src="{{ isset($data->file_moa) ? asset($data->file_path . $data->file_moa) : '' }}"
                                    onclick="DokumenMoa.showFile(this, event)">
                                    Lihat / Download File
                                </button>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Nomor Moa</label>
                                <input type='text' id="nomor_moa" class="form-control required" error="Nomor Moa"
                                    value="{{ isset($data->nomor_moa) ? $data->nomor_moa : '' }}"
                                    placeholder="Nomor Moa">
                            </div>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label class="form-label">Tanggal Dibuat</label>
                            <input type='text' id="tanggal_dibuat" class="form-control flatpickr required"
                                error="Tanggal Dibuat"
                                value="{{ isset($data->tanggal_dibuat) ? $data->tanggal_dibuat : '' }}"
                                placeholder="YYYY-MM-D">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Tanggal berakhir</label>
                            <input type='text' id="tanggal_berakhir" class="form-control flatpickr required"
                                error="Tanggal Berakhir"
                                value="{{ isset($data->tanggal_berakhir) ? $data->tanggal_berakhir : '' }}"
                                placeholder="YYYY-MM-D">
                        </div>

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label" for="jenis">Pilih Jenis DOC</label>
                                <select id="jenis" name="jenis" class=" form-select required"
                                    data-allow-clear="true" error="jenis" disabled>
                                    <option value="{{ isset($data->jenis_doc_id) ? $data->jenis_doc_id : '' }}">
                                        {{ isset($data->nama_jenis) ? $data->nama_jenis : '' }}</option>
                                    @foreach ($list_jenis as $item)
                                        <option value="{{ $item->id }}"
                                            {{ isset($data->jenis_doc) && $data->jenis_doc == $item->id ? 'selected' : '' }}>
                                            {{ $item->nama_jenis }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label" for="kategori">Pilih kategori Doc / jenis mitra doc</label>
                                <select id="kategori" name="kategori" class="select2 form-select required"
                                    data-allow-clear="true" error="kategori">
                                    <option value="{{ isset($data->kategori_doc_id) ? $data->kategori_doc_id : '' }}">
                                        {{ isset($data->nama_kategori) ? $data->nama_kategori : '' }}</option>
                                    @foreach ($list_kategori as $item)
                                        <option value="{{ $item->id }}"
                                            {{ isset($data->kategori_moa) && $data->kategori_moa == $item->id ? 'selected' : '' }}>
                                            {{ $item->nama_kategori }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label" for="level">Pilih Level Dokumen</label>
                                <select id="level" name="level" class="select2 form-select required"
                                    data-allow-clear="true" error="level">
                                    <option value="{{ isset($data->level_doc_id) ? $data->level_doc_id : '' }}">
                                        {{ isset($data->nama_level) ? $data->nama_level : '' }}</option>
                                    @foreach ($list_level as $item)
                                        <option value="{{ $item->id }}"
                                            {{ isset($data->level_moa) && $data->level_moa == $item->id ? 'selected' : '' }}>
                                            {{ $item->nama_level }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                @php
                                    $list_status = ['AKTIF', 'TIDAK AKTIF'];
                                @endphp
                                <label class="form-label" for="level">Status Dokumen</label>
                                <select id="status" name="status" class="select2 form-select required"
                                    data-allow-clear="true" error="status">
                                    @foreach ($list_status as $item)
                                        <option value="{{ $item }}"
                                            {{ isset($data->status) && $data->status == $item ? 'selected' : '' }}>
                                            {{ $item }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label" for="relevansi_prodi">Relevansi Prodi</label>
                                <select id="relevansi_prodi" name="relevansi_prodi"
                                    class="select2 form-select required" data-allow-clear="true"
                                    error="Relevansi Prodi">
                                    <option value="{{ isset($data->relevansi_prodi) ? $data->relevansi_prodi : '' }}">
                                        {{ isset($data->nama_relevansi_prodi) ? $data->nama_relevansi_prodi : '' }}
                                    </option>
                                    @foreach ($list_prodi as $item)
                                        <option value="{{ $item->id }}"
                                            {{ isset($data->relevansi_prodi) && $data->relevansi_prodi == $item->id ? 'selected' : '' }}>
                                            {{ $item->nama_prodi }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="col-md-12 mb-3">
                            <label class="form-label" for="basic-icon-default-fullname">kerja sama dengan</label>
                            <textarea class="form-control required" error="kerja sama dengan" placeholder="kerja sama dengan"
                                name="kerja_sama_dengan" id="kerja_sama_dengan" cols="10" rows="5">{!! isset($data->kerja_sama_dengan) ? $data->kerja_sama_dengan : '' !!}</textarea>
                        </div>

                    </div>
                    <div class="text-end mt-3 mb-3">
                        <button type="button" class="btn btn-danger me-2" data_id='{{ isset($id) ? $id : '' }}'
                            kerja_sama_dengan = '{{ isset($data->kerja_sama_dengan) ? $data->kerja_sama_dengan : '' }}'
                            onclick="DokumenMoa.delete(this, event)">
                            <span><i class="bx bx-trash me-sm-2"></i>
                                <span class="d-none d-sm-inline-block">Hapus</span>
                            </span>
                        </button>
                        <button type="button" class="btn btn-primary me-2"
                            onclick="DokumenMoa.updated(this, event)">
                            <span><i class="bx bx-check-circle me-sm-2"></i>
                                <span class="d-none d-sm-inline-block">Updated</span>
                            </span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
