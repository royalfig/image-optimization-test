const formatDuration = (ms) => {
  if (ms < 0) ms = -ms;

  const time = {
    d: Math.floor(ms / 86400000),
    h: Math.floor(ms / 3600000) % 24,
    m: Math.floor(ms / 60000) % 60,
    s: Math.floor(ms / 1000) % 60,
    ms: Math.floor(ms) % 1000,
  };

  const times = Object.entries(time).filter((val) => val[1] !== 0);

  if (times.length === 2 && times[0][0] === "s" && times[1][0] === "ms") {
    return (
      times[0][1] + "." + (times[1][1] / 1000).toFixed(2).substring(2) + " s"
    );
  }

  // return

  const d = Object.entries(time)
    .filter((val) => val[1] !== 0)
    .map((val) => {
      // if (val[0] === "ms") {
      //   return "." + Math.floor(1000 / val[1]) + " s";
      // }
      return val[1] + " " + val[0];
    });

  return d.join(", ");
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
          assets/cactus-300.avif?cb=${Date.now()} 300w,
          assets/cactus-500.avif?cb=${Date.now()} 500w,
          assets/cactus-700.avif?cb=${Date.now()} 700w,
          assets/cactus-900.avif?cb=${Date.now()} 900w,
          assets/cactus-1100.avif?cb=${Date.now()} 1100w,
          assets/cactus-1300.avif?cb=${Date.now()} 1300w,
          assets/cactus-1500.avif?cb=${Date.now()} 1500w,
          assets/cactus-1700.avif?cb=${Date.now()} 1700w,
          assets/cactus-1900.avif?cb=${Date.now()} 1900w,
          assets/cactus-2100.avif?cb=${Date.now()} 2100w
        "
        sizes="(max-width: 1300px) 100vw, 1300px"
        type="image/avif"
        height="747" width="1100"
      />
      <source
        srcset="
          assets/cactus-300.webp?cb=${Date.now()} 300w,
          assets/cactus-500.webp?cb=${Date.now()} 500w,
          assets/cactus-700.webp?cb=${Date.now()} 700w,
          assets/cactus-900.webp?cb=${Date.now()} 900w,
          assets/cactus-1100.webp?cb=${Date.now()} 1100w,
          assets/cactus-1300.webp?cb=${Date.now()} 1300w,
          assets/cactus-1500.webp?cb=${Date.now()} 1500w,
          assets/cactus-1700.webp?cb=${Date.now()} 1700w,
          assets/cactus-1900.webp?cb=${Date.now()} 1900w,
          assets/cactus-2100.webp?cb=${Date.now()} 2100w
        "
        sizes="(max-width: 1300px) 100vw, 1300px"
        type="image/webp"
        height="747" width="1100"
      />
      <img
        srcset="
          assets/cactus-300.jpg?cb=${Date.now()} 300w,
          assets/cactus-500.jpg?cb=${Date.now()} 500w,
          assets/cactus-700.jpg?cb=${Date.now()} 700w,
          assets/cactus-900.jpg?cb=${Date.now()} 900w,
          assets/cactus-1100.jpg?cb=${Date.now()} 1100w,
          assets/cactus-1300.jpg?cb=${Date.now()} 1300w,
          assets/cactus-1500.jpg?cb=${Date.now()} 1500w,
          assets/cactus-1700.jpg?cb=${Date.now()} 1700w,
          assets/cactus-1900.jpg?cb=${Date.now()} 1900w,
          assets/cactus-2100.jpg?cb=${Date.now()} 2100w
        "
        sizes="(max-width: 1300px) 100vw, 1300px"
        src="assets/cactus-1100.jpg?cb=${Date.now()}"
        alt="Cactus image loaded responsively"
        height="747" width="1100"
        
      />
    </picture>
    <figcaption>Responsive</figcaption>
  </figure>

  <figure>
    <img src="./assets/cactus-resized-and-compressed.jpg?cb=${Date.now()}" alt="Cactus image, resized and compressed" width="1500" height="1018" />
    <figcaption>Resized &amp; Compressed</figcaption>
  </figure>

  <figure>
    <img src="./assets/cactus-resized.jpg?cb=${Date.now()}" alt="Cactus image, resized" width="1500" height="1018" />
    <figcaption>Resized</figcaption>
  </figure>

  <figure>
    <img src="./assets/cactus.avif?cb=${Date.now()}" alt="Cactus image in AVIF format" width="4678" height="3175" />
    <figcaption>AVIF</figcaption>
  </figure>
  
  <figure>
    <img src="./assets/cactus.webp?cb=${Date.now()}" alt="Cactus image in WEBP format" width="4678" height="3175" />
    <figcaption>WebP</figcaption>
  </figure>

  <figure>
    <img src="./assets/cactus-compressed.jpg?cb=${Date.now()}" alt="Cactus image, compressed" width="4678" height="3175" />
    <figcaption>Compressed</figcaption>
  </figure>

  <figure>
    <img src="./assets/cactus.jpg?cb=${Date.now()}" alt="Cactus image, unoptimized" width="4678" height="3175" />
    <figcaption>Unoptimized</figcaption>
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
    name.innerHTML = `<div><svg width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
    <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
    <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
  </svg>${el.name}</div>
  <div><svg width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
  <path d="M8.5 5.6a.5.5 0 1 0-1 0v2.9h-3a.5.5 0 0 0 0 1H8a.5.5 0 0 0 .5-.5V5.6z"/>
  <path d="M6.5 1A.5.5 0 0 1 7 .5h2a.5.5 0 0 1 0 1v.57c1.36.196 2.594.78 3.584 1.64a.715.715 0 0 1 .012-.013l.354-.354-.354-.353a.5.5 0 0 1 .707-.708l1.414 1.415a.5.5 0 1 1-.707.707l-.353-.354-.354.354a.512.512 0 0 1-.013.012A7 7 0 1 1 7 2.071V1.5a.5.5 0 0 1-.5-.5zM8 3a6 6 0 1 0 .001 12A6 6 0 0 0 8 3z"/>
</svg>${formatDuration(el.duration)}</div>
${
  el.size
    ? `<div><svg width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
      <path d="M12 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0Zm0 11a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0Zm-7.5.5a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1ZM5 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0ZM8 8a1 1 0 1 0 0-2 1 1 0 0 0 0 2Z"/>
      <path d="M12 7a4 4 0 0 1-3.937 4c-.537.813-1.02 1.515-1.181 1.677a1.102 1.102 0 0 1-1.56-1.559c.1-.098.396-.314.795-.588A4 4 0 0 1 8 3a4 4 0 0 1 4 4Zm-1 0a3 3 0 1 0-3.891 2.865c.667-.44 1.396-.91 1.955-1.268.224-.144.483.115.34.34l-.62.96A3.001 3.001 0 0 0 11 7Z"/>
      <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2Zm2-1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H4Z"/>
      </svg>` +
      getReadableFileSizeString(el.size) +
      "</div>"
    : ""
}`;

    const duration = document.createElement("div");
    const amount = Number(el.duration / max).toFixed(2) * 100;
    duration.textContent = amount;

    const inner = document.createElement("div");
    inner.style = `width: ${amount}%; height: 100%; background: #7c7048`;

    div.append(inner);
    div.append(name);

    graphs.append(div);
  });
});
