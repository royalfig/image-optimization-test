
const formatDuration = ms => {
    if (ms < 0) ms = -ms;
    const time = {
      day: Math.floor(ms / 86400000),
      hour: Math.floor(ms / 3600000) % 24,
      minute: Math.floor(ms / 60000) % 60,
      second: Math.floor(ms / 1000) % 60,
      millisecond: Math.floor(ms) % 1000
    };
    return Object.entries(time)
      .filter(val => val[1] !== 0)
      .map(val => val[1] + ' ' + (val[1] !== 1 ? val[0] + 's' : val[0]))
      .join(', ');
  };

const getReadableFileSizeString = fileSizeInBytes => {
    var i = fileSizeInBytes == 0 ? 0 : Math.floor(Math.log(fileSizeInBytes) / Math.log(1024));
    return (fileSizeInBytes / Math.pow(1024, i)).toFixed(2) * 1 + ' ' + ['B', 'kB', 'MB', 'GB', 'TB'][i];
}

window.addEventListener("load", () => {
    let durations = [];

    const resources = performance.getEntriesByType("resource")

    resources.forEach(resource => {
        console.log(resource)
        if (resource.initiatorType === "img") {
            const lastSlash = resource.name.lastIndexOf("/")
            const filename = resource.name.slice(lastSlash + 1)
            const img = document.querySelector(`[src*="${filename}"]`) || document.querySelector(`[srcset*="${filename}"]`)
            if (!img) return;
            const parent = img.closest('figure');
            const caption = parent.querySelector('figcaption').textContent;
            const duration = Math.round(resource.responseEnd - resource.responseStart);
            durations.push({ name: caption, duration, size: resource.encodedBodySize || null })
            const span = document.createElement('span')
            span.classList.add("time")
            span.textContent = formatDuration(duration)
            parent.append(span)
        }
    })

    const sorted = durations.sort((a, b) => a.duration - b.duration)
    const max = sorted[sorted.length - 1].duration
    const graphs = document.querySelector('.graphs')
    document.body.classList.toggle('loading')
    graphs.innerHTML = ""

    sorted.forEach(el => {
        const div = document.createElement('div')
        div.classList.add('graph')

        const name = document.createElement('div')
        name.classList.add('name')
        name.textContent = `${el.name} (${formatDuration(el.duration)}${el.size ? ", " + getReadableFileSizeString(el.size) : ""})`

        const duration = document.createElement('div')
        const amount = Number(el.duration / max).toFixed(2) * 100
        duration.textContent = amount

        const inner = document.createElement('div')
        inner.style = `width: ${amount}%; height: 100%; background: #e70e60`


        div.append(inner)
        div.append(name)

        graphs.append(div)
    })
})

