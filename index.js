const formatDuration = (ms) => {
  if (ms < 0) ms = -ms;
  const time = {
    day: Math.floor(ms / 86400000),
    hour: Math.floor(ms / 3600000) % 24,
    minute: Math.floor(ms / 60000) % 60,
    second: Math.floor(ms / 1000) % 60,
    millisecond: Math.floor(ms) % 1000,
  };
  return Object.entries(time)
    .filter((val) => val[1] !== 0)
    .map((val) => val[1] + " " + (val[1] !== 1 ? val[0] + "s" : val[0]))
    .join(", ");
};

const getReadableFileSizeString = (fileSizeInBytes) => {
  var i =
    fileSizeInBytes == 0
      ? 0
      : Math.floor(Math.log(fileSizeInBytes) / Math.log(1024));
  return (
    (fileSizeInBytes / Math.pow(1024, i)).toFixed(2) * 1 +
    " " +
    ["B", "kB", "MB", "GB", "TB"][i]
  );
};

const renderImages = () => {
  const template = `<figure>
    <picture>
      <source
        srcset="
          ./assets/cactus-300.avif?cb=${Date.now()} 300w,
          ./assets/cactus-500.avif?cb=${Date.now()} 500w,
          ./assets/cactus-700.avif?cb=${Date.now()} 700w,
          ./assets/cactus-900.avif?cb=${Date.now()} 900w,
          ./assets/cactus-1100.avif?cb=${Date.now()} 1100w,
          ./assets/cactus-1300.avif?cb=${Date.now()} 1300w,
          ./assets/cactus-1500.avif?cb=${Date.now()} 1500w,
          ./assets/cactus-1700.avif?cb=${Date.now()} 1700w,
          ./assets/cactus-1900.avif?cb=${Date.now()} 1900w,
          ./assets/cactus-2100.avif?cb=${Date.now()} 2100w
        "
        type="image/avif"
      />
      <source
        srcset="
          ./assets/cactus-300.webp?cb=${Date.now()} 300w,
          ./assets/cactus-500.webp?cb=${Date.now()} 500w,
          ./assets/cactus-700.webp?cb=${Date.now()} 700w,
          ./assets/cactus-900.webp?cb=${Date.now()} 900w,
          ./assets/cactus-1100.webp?cb=${Date.now()} 1100w,
          ./assets/cactus-1300.webp?cb=${Date.now()} 1300w,
          ./assets/cactus-1500.webp?cb=${Date.now()} 1500w,
          ./assets/cactus-1700.webp?cb=${Date.now()} 1700w,
          ./assets/cactus-1900.webp?cb=${Date.now()} 1900w,
          ./assets/cactus-2100.webp?cb=${Date.now()} 2100w
        "
        type="image/webp"
      />
      <img
        sizes="100vw"
        srcset="
          ./assets/cactus-300.jpg?cb=${Date.now()} 300w,
          ./assets/cactus-500.jpg?cb=${Date.now()} 500w,
          ./assets/cactus-700.jpg?cb=${Date.now()} 700w,
          ./assets/cactus-900.jpg?cb=${Date.now()} 900w,
          ./assets/cactus-1100.jpg?cb=${Date.now()} 1100w,
          ./assets/cactus-1300.jpg?cb=${Date.now()} 1300w,
          ./assets/cactus-1500.jpg?cb=${Date.now()} 1500w,
          ./assets/cactus-1700.jpg?cb=${Date.now()} 1700w,
          ./assets/cactus-1900.jpg?cb=${Date.now()} 1900w,
          ./assets/cactus-2100.jpg?cb=${Date.now()} 2100w
        "
        src="./assets/cactus-1100.jpg?cb=${Date.now()}"
        alt="Cactus image loaded responsively"
        width="2100"
        height="1425"
      />
    </picture>
    <figcaption>RESPONSIVE</figcaption>
  </figure>

  <figure>
    <img src="./assets/cactus-resized-and-compressed.jpg?cb=${Date.now()}" alt="Cactus image, resized and compressed" width="1500" height="1018" />
    <figcaption>RESIZED &amp; COMPRESSED</figcaption>
  </figure>

  <figure>
    <img src="./assets/cactus-resized.jpg?cb=${Date.now()}" alt="Cactus image, resized" width="1500" height="1018" />
    <figcaption>RESIZED</figcaption>
  </figure>

  <figure>
    <img src="./assets/cactus.avif?cb=${Date.now()}" alt="Cactus image in AVIF format" width="4678" height="3175" />
    <figcaption>AVIF</figcaption>
  </figure>
  
  <figure>
    <img src="./assets/cactus.webp?cb=${Date.now()}" alt="Cactus image in WEBP format" width="4678" height="3175" />
    <figcaption>WEBP</figcaption>
  </figure>

  <figure>
    <img src="./assets/cactus-compressed.jpg?cb=${Date.now()}" alt="Cactus image, compressed" width="4678" height="3175" />
    <figcaption>COMPRESSED</figcaption>
  </figure>

  <figure>
    <img src="./assets/cactus.jpg?cb=${Date.now()}" alt="Cactus image, unoptimized" width="4678" height="3175" />
    <figcaption>UNOPTIMIZED</figcaption>
  </figure>`;

  const imageContainer = document.querySelector(".images");

  imageContainer.innerHTML = template;
};

renderImages();

window.addEventListener("load", () => {
  let durations = [];

  const resources = performance.getEntriesByType("resource");

  resources.forEach((resource) => {
    console.log(resource);
    if (resource.initiatorType === "img") {
      const lastSlash = resource.name.lastIndexOf("/");
      const filename = resource.name.slice(lastSlash + 1);
      const img =
        document.querySelector(`[src*="${filename}"]`) ||
        document.querySelector(`[srcset*="${filename}"]`);
      if (!img) return;
      const parent = img.closest("figure");
      const caption = parent.querySelector("figcaption").textContent;
      const duration = Math.round(resource.duration);
      durations.push({
        name: caption,
        duration,
        size: resource.encodedBodySize || null,
      });
      const span = document.createElement("span");
      span.classList.add("time");
      span.textContent = formatDuration(duration);
      parent.append(span);
    }
  });

  const sorted = durations.sort((a, b) => a.duration - b.duration);
  const max = sorted[sorted.length - 1].duration;
  const graphs = document.querySelector(".graphs");
  document.body.classList.toggle("loading");
  graphs.innerHTML = "";

  sorted.forEach((el) => {
    const div = document.createElement("div");
    div.classList.add("graph");

    const name = document.createElement("div");
    name.classList.add("name");
    name.textContent = `${el.name} (${formatDuration(el.duration)}${
      el.size ? ", " + getReadableFileSizeString(el.size) : ""
    })`;

    const duration = document.createElement("div");
    const amount = Number(el.duration / max).toFixed(2) * 100;
    duration.textContent = amount;

    const inner = document.createElement("div");
    inner.style = `width: ${amount}%; height: 100%; background: #e70e60`;

    div.append(inner);
    div.append(name);

    graphs.append(div);
  });
});
