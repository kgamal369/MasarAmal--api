// app/assets/javascripts/active_admin.js
document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.editable').forEach(function(element) {
      element.addEventListener('blur', function() {
        var cmsValueId = this.dataset.id;
        var newValue = this.value;
  
        // AJAX request to update cms_value
        fetch('/admin/cms_values/' + cmsValueId, {
          method: 'PATCH',
          headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
          },
          body: JSON.stringify({ cms_value: { value: newValue } })
        })
        .then(response => response.json())
        .then(data => {
          alert('Value updated successfully');
        })
        .catch((error) => {
          console.error('Error:', error);
        });
      });
    });
  });
  