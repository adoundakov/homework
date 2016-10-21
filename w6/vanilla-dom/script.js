document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  // adding pois to a list
  const addPOI = (e) => {
    e.preventDefault();
    const input = document.getElementsByClassName("favorite-input")[0];
    const poi = input.value;
    input.value = '';
    const poiList = document.getElementById("sf-places");
    const li = document.createElement("li");
    li.textContent = poi;
    poiList.appendChild(li);
  };

  // adding own photos
  const toggleForm = (e) => {
    e.preventDefault();
    const form = document.getElementsByClassName('photo-form-container')[0];
    let shown = !form.className.includes('hidden');
    if (shown) {
      form.className += " hidden";
    } else {
      form.className = "photo-form-container";
    }
  };

  const addPhoto = (e) => {
    // adds photo and clears form
    e.preventDefault();
    const input = document.getElementsByClassName('photo-url-input')[0];
    const url = input.value;
    input.value = '';
    const photos = document.getElementsByClassName('dog-photos')[0];
    let li = document.createElement('li');
    li.innerHTML = `<img src="${url}"/>`;
    photos.appendChild(li);
  };

  // adding event Listeners
  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });

  // adding SF places as list items
  let submit = document.getElementsByClassName("favorite-submit")[0];
  submit.addEventListener("click", addPOI);

  // adding new photos
  let photoShowButton = document.getElementsByClassName('photo-show-button')[0];
  photoShowButton.addEventListener('click', toggleForm);

  let submitForm = document.getElementsByClassName('photo-url-submit')[0];
  submitForm.addEventListener('click', addPhoto);



});
