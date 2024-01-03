// app/assets/javascripts/active_admin.js

document.addEventListener('DOMContentLoaded', function() {
  document.querySelectorAll('.details-save-button').forEach(function(button) {
    button.addEventListener('click', function(event) {
      event.preventDefault(); // Prevent default form submission behavior

      var cmsValueId = this.dataset.id;
      var inputField = document.querySelector('.editable[data-id="' + cmsValueId + '"]');
      var newValue = inputField.value;

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
