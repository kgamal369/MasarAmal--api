//app/assets/javascripts/active_admin.js
document.addEventListener('DOMContentLoaded', function() {
  const saveButton = document.getElementById('save_button_id');
  saveButton.addEventListener('click', function(event) {
    event.preventDefault();

    const cmsValueId = document.getElementById('cms_value_id').value;
    const value = document.getElementById('value_input_id').value;

    fetch(`/admin/cms_values/${cmsValueId}`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      },
      body: JSON.stringify({ cms_value: { value: value } })
    })
    .then(response => response.json())
    .then(data => {
      if (data.status === 'success') {
        alert('Value updated successfully');
      } else {
        alert('Error updating value');
      }
    })
    .catch(error => {
      console.error('Error:', error);
    });
  });
});
