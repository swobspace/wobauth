ready = ->
  $('table tfoot th').each  (idx) ->
    unless $(this).hasClass("nosearch")
      title = $('table thead th').eq( $(this).index() ).text()
      $(this).html( '<input type="text" placeholder="search") %>" name="idx'+idx+'" />' )

  # --- simple datatable ---
  xtable = $('table[role="xdatatable"]' ).DataTable(
    pagingType: "full_numbers"
  )

  # --- classic datatable ---
  table = $('table[role="datatable"], table[role="wobauth_datatable"]' ).DataTable(
    pagingType: "full_numbers"
    dom: "<'row'<'col-md-3'l><'col-md-5 btn-group'BC><'col-md-4'f>>t<'row'<'col-md-6'ir><'col-md-6'p>>"
    stateSave: true
    lengthMenu: [ [10, 25, 100, 250, 1000], [10, 25, 100, 250, 1000] ]
    buttons: [
      {
        extend: 'copy',
        exportOptions: {
          columns: ':visible',
          search: ':applied'
        }
      },
      {
        extend: 'excel',
        exportOptions: {
          columns: ':visible',
          search: ':applied'
        }
      },
      {
        extend: 'pdf',
        orientation: 'landscape',
        pageSize: 'A4',
        exportOptions: {
          columns: ':visible',
          search: ':applied'
        }
      },
      'print',
      {
        extend: 'colvis',
        columns: ':gt(0)'
      }
    ],
    columnDefs: [
      { "targets": "nosort", "orderable": false },
      { "targets": "notvisible", "visible": false }
    ]
  )
  if $('table[role="datatable"]').length
    table.columns().eq(0).each (colIdx) ->
      $('input[name=idx'+colIdx+']').on( 'keyup change', ->
        table.column(colIdx).search(this.value).draw()
      )
  # if table.length
  table.columns().search('').draw()
  $('input[type=search]').val("").trigger('input')

  $("#reset_table").on("click",  ->
    $('input[type=text]').val("")
    table.columns().search('').draw()
    $('input[type=search]').val("").trigger('input')
  )
  # --- end classic datatable ---

  # --- remote datatable ---
  remotetableurl = $('table[role="remotetable"]').data('url')
  remotetable = $('table[role="remotetable"]').DataTable(
    searchDelay: 1000
    processing: true
    serverSide: true
    ajax:
      url: remotetableurl
      type: "POST"
    pagingType: "full_numbers"
    dom: "<'row'<'col-md-3'l><'col-md-5 btn-group'BC><'col-md-4'f>>t<'row'<'col-md-6'ir><'col-md-6'p>>"
    stateSave: true
    lengthMenu: [ [10, 25, 100, 250, 1000], [10, 25, 100, 250, 1000] ]
    buttons: [
      {
        extend: 'excel'
        title: $('table[role="remotetable"]').data('title')
        exportOptions: {
          columns: ':visible',
          search: ':applied'
        }
      },
      {
        extend: 'pdf',
        orientation: 'landscape',
        pageSize: 'A4',
        title: $('table[role="remotetable"]').data('title')
        exportOptions: {
          columns: ':visible',
          search: ':applied'
        }
      },
      'print',
      {
        extend: 'colvis',
        columns: ':gt(0)'
      }
    ],
    columnDefs: [
      { "targets": "nosort", "orderable": false },
      { "targets": "notvisible", "visible": false }
    ]
  )
  if $('table[role="remotetable"]').length
    remotetable.columns().eq(0).each (colIdx) ->
      $('input[name=idx'+colIdx+']').on( 'keyup change', ->
        remotetable.column(colIdx).search(this.value).draw()
      )

  # if remotetable.length
  remotetable.columns().search('').draw()
  $('input[type=search]').val("").trigger('input')

  $("#reset_table").on("click",  ->
    $('input[type=text]').val("")
    remotetable.columns().search('').draw()
    $('input[type=search]').val("").trigger('input')
  )
  # --- end remote datatable ---

  $('.select2').select2
    width: 'element'

$(document).ready(ready)
