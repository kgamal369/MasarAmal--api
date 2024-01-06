document.addEventListener('DOMContentLoaded', function() {
  const saveButton = document.getElementById('your-save-button-id'); // Replace with your save button's ID
  saveButton.addEventListener('click', function(event) {
    event.preventDefault();

    const pageName = document.getElementById('page_name_input_id').value; // Replace with your input IDs
    const sectionName = document.getElementById('section_name_input_id').value;
    const language = document.getElementById('language_input_id').value;

    fetch(batch_action_admin_cms_values_path, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      },
      body: new URLSearchParams({
        'batch_action': 'update_values',
        'inputs[page_name]': pageName,
        'inputs[section_name]': sectionName,
        'inputs[language]': language
      })
    })
    .then(response => response.json())
    .then(data => {
      // Handle response
    })
    .catch(error => {
      console.error('Error:', error);
    });
  });
});
