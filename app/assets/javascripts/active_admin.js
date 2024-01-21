// app/assets/javascripts/active_admin.js
console.log("Active Admin JS loaded");
console.log("KGamal Test 3");

function setupEventListeners() {
  console.log("setupEventListeners loaded");

  const pageSelect = document.getElementById('cms_page_select');
  const sectionSelect = document.getElementById('cms_section_select');
  const componentSelect = document.getElementById('cms_component_select');

  if (pageSelect) {
    pageSelect.addEventListener('change', function() {
      console.log("Page selection changed to: ", this.value);
      fetch(`/cms_values/dropdownlist_sections_for_page/${this.value}`)
              .then(response => response.json())
              .then(sections => {
                updateDropdown(sectionSelect, sections);
                sectionSelect.disabled = false;
                componentSelect.innerHTML = '';
                componentSelect.disabled = true;
              });
           });
  } else {
    console.log("Page select element not found");
  }

  if (sectionSelect) {
    sectionSelect.addEventListener('change', function() {
      console.log("Section selection changed to: ", this.value);
      fetch(`/cms_values/dropdownlist_components_for_section/${this.value}`)
              .then(response => response.json())
              .then(components => {
                updateDropdown(componentSelect, components);
                componentSelect.disabled = false;
              });   
             });
  } else {
    console.log("Section select element not found");
  }
  if (componentSelect) {
    componentSelect.addEventListener('change', function() {
      updateFormFieldBasedOnComponent(this.value);
    });
  }
}


function updateFormFieldBasedOnComponent(componentId) {
  fetch(`/cms_values/is_image_component/${componentId}`)
  .then(response => response.json())
  .then(data => {
    const imageInput = document.getElementById('image_input');
    const valueInput = document.getElementById('value_input');

    if (imageInput && valueInput) {
      const imageInputContainer = imageInput.closest('.input');
      const valueInputContainer = valueInput.closest('.input');

      if (data.is_image_component) {
        imageInput.closest('.input').style.display = 'block'; // Show image upload
        valueInput.closest('.input').style.display = 'none';   // Hide text input
      } else {
        imageInput.closest('.input').style.display = 'none';   // Hide image upload
        valueInput.closest('.input').style.display = 'block';  // Show text input
      }
    } else {
      console.error('Form elements not found');
    }
  });
}
// Execute the setup function directly
// Delay the execution of the setup function
setTimeout(setupEventListeners, 1000); 

// For debugging: Call this function in the browser console if needed
function testDirectExecution() {
  console.log("Testing direct execution of setupEventListeners");
  setupEventListeners();
}

  function updateDropdown(dropdown, items) {
    console.log("Updating dropdown with items:", items);
    dropdown.innerHTML = '';
    items.forEach(item => {
      const option = new Option(item.name, item.id);
      dropdown.appendChild(option);
    });
  }
// console.log("Active Admin JS loaded");
// console.log(document.getElementById('cms_page_select'));

// document.addEventListener('turbolinks:load', function() {
//   console.log(document.getElementById('cms_page_select'));
//   console.log("inside turbolinks:load event listener");
//   const pageSelect = document.getElementById('cms_page_select');
//   const sectionSelect = document.getElementById('cms_section_select');
//   const componentSelect = document.getElementById('cms_component_select');

//   if (pageSelect) {
//     pageSelect.addEventListener('change', function() {
//       console.log("Page selection changed to: ", this.value);
//       fetch(`/cms_values/dropdownlist_sections_for_page/${this.value}`)
//         .then(response => response.json())
//         .then(sections => {
//           updateDropdown(sectionSelect, sections);
//           sectionSelect.disabled = false;
//           componentSelect.innerHTML = '';
//           componentSelect.disabled = true;
//         });
//     });
//   } else {
//     console.log("Page select element not found");
//   }

//   if (sectionSelect) {
//     sectionSelect.addEventListener('change', function() {
//       console.log("Section selection changed to: ", this.value);
//       fetch(`/cms_values/dropdownlist_components_for_section/${this.value}`)
//         .then(response => response.json())
//         .then(components => {
//           updateDropdown(componentSelect, components);
//           componentSelect.disabled = false;
//         });
//     });
//   } else {
//     console.log("Section select element not found");
//   }

//   function updateDropdown(dropdown, items) {
//     console.log("Updating dropdown with items:", items);
//     dropdown.innerHTML = '';
//     items.forEach(item => {
//       const option = new Option(item.name, item.id);
//       dropdown.appendChild(option);
//     });
//   }

// });
