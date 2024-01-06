document.addEventListener('DOMContentLoaded', function() {
  const pageSelect = document.getElementById('cms_page_select');
  const sectionSelect = document.getElementById('cms_section_select');
  const componentSelect = document.getElementById('cms_component_select');

  pageSelect.addEventListener('change', function() {
    fetch(`/admin/sections_for_page/${this.value}`)
      .then(response => response.json())
      .then(sections => {
        updateDropdown(sectionSelect, sections);
        sectionSelect.disabled = false;
        componentSelect.innerHTML = ''; // Reset component dropdown
        componentSelect.disabled = true;
      });
  });

  sectionSelect.addEventListener('change', function() {
    fetch(`/admin/components_for_section/${this.value}`)
      .then(response => response.json())
      .then(components => {
        updateDropdown(componentSelect, components);
        componentSelect.disabled = false;
      });
  });

  function updateDropdown(dropdown, items) {
    dropdown.innerHTML = '';
    items.forEach(item => {
      const option = new Option(item.name, item.id);
      dropdown.appendChild(option);
    });
  }
});
