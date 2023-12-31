//= require active_admin/base
document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.editable').forEach(function(element) {
      element.addEventListener('blur', function() {
        var cmsValueId = this.dataset.id;
        var newValue = this.value;
  
        // AJAX request to update cms_value
        // Example AJAX request using Fetch API
        fetch('/path_to_update_action', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
          },
          body: JSON.stringify({ id: cmsValueId, value: newValue })
        })
        .then(response => response.json())
        .then(data => {
          console.log('Success:', data);
        })
        .catch((error) => {
          console.error('Error:', error);
        });
      });
    });
  });
  