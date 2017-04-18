
$(function() {
var wavesurfer = Object.create(WaveSurfer);

wavesurfer.init({
    container: '#waveform',
    barWidth: 1,
    waveColor: 'white',
    progressColor: 'orange',
    cursorWidth: 0

});

wavesurfer.load('https://wavesurfer-js.org/example/split-channels/stereo.mp3');

var slider = document.querySelector('#slider');

slider.oninput = function() {
    var zoomLevel = Number(slider.value);
    wavesurfer.zoom(zoomLevel);
};

});