window.interop = {

//  Canvas management
  Canvas : HTMLCanvasElement,

  //  Gets the canvas.
  _GetCanvas: function () {
    if (Canvas === null)
      Canvas = document.getElementById("Canvas");

    var OffsetHeight = Canvas.offsetHeight;
    if (Canvas.height !== OffsetHeight)
      Canvas.height = Canvas.offsetHeight;

    var OffsetWidth = Canvas.offsetWidth;
    if (Canvas.width !== OffsetWidth)
      Canvas.width = Canvas.offsetWidth;

    console.log(Canvas.width.toString() + " " + Canvas.height.toString());
    return Canvas;
  },

  //  Gets the height of the canvas.
  GetCanvasHeight: function () {
    return window.interop._GetCanvas().height;
  },

  //  Gets the width of the canvas.
  GetCanvasWidth: function () {
    return window.interop._GetCanvas().width;
  },

};