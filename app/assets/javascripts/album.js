jQuery(document).on('turbolinks:load', function() {
  // Enable file upload button
  // after file has been selected.
  
  $('input:file').change (
    function() {
      if ($(this).val()) {
        $('input:submit').attr('disabled',false);
    }
  });

  // Set up datatable.
  var table = $('#albums-table').dataTable({
    "search": {
      "caseInsensitive": false
    },
    "processing": true,
    "serverSide": true,
    "sAjaxSource": $('#albums-table').data('source'),
    "pagingType": "full_numbers",
    "language": {
      "searchPlaceholder": "search"
    },
    "language": {
      "search": "search"
    },

    // Add extra column for delete action.
    "aoColumnDefs": [
    {
      "bSortable": false,
      "aTargets": [5],
      "mData": null,
      "mRender": function (data, type, full) {
        return '<div class="btn-group" role="group"><button type="button" class="btn btn-primary edit_record" data-id=' + data[5] + ' data-method="get">Edit</button><button type="button" class="btn btn-danger delete_record" data-id='+data[5]+' data-method="delete">Delete</button></div>';
      }
    }
    ]
  });

  // Send csrf token.
  $.ajaxSetup({
    headers: {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    }
  });

  // Handle deletion of record.
  $(document).on('click', '.delete_record', function(evt) {
    evt.preventDefault();
    var $this = $(this);
    var url = '/albums/'+$this.data().id;
    $.ajax({
      url: url,
      method: 'delete',
      context: document.body
    }).done(function() {
      table.api().draw();
    });
  });

  // Handle edit of record
  $(document).on('click', '.edit_record', function(evt) {
    evt.preventDefault();
    var $this = $(this);
    var method = $this.data().method;
    var url = '/albums/' + $this.data().id + '/edit';

    $.ajax({
      url: url,
      method: 'get',
      context: document.body
    }).done(function() {
      window.location = url;
    });
  });
});