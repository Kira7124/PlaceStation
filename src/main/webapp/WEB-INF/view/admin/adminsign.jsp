<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signature</title>
</head>


<style>
        .container {
            position: absolute;
            left: 50px;
            top: 50px;
        }

        #canvas {
            width: 300px;
            height: 240px;
            border: 1px solid black;
        }
</style>


<body>
    <div class="container">
        <canvas id="canvas" width="300" height="240"></canvas>
        <button id="erase">지우기</button>
    </div>
</body>



<script>
var isDrawing = false;
var x = 0;
var y = 0;

var canvas = document.getElementById("canvas");
var ctx = canvas.getContext("2d");

canvas.addEventListener("mousedown", function (e) {
    x = e.offsetX;
    y = e.offsetY;
    isDrawing = true;
});

canvas.addEventListener("mousemove", function (e) {
    if (isDrawing) {
        drawSign(ctx, x, y, e.offsetX, e.offsetY);
        x = e.offsetX;
        y = e.offsetY;
    }
});

canvas.addEventListener("mouseup", function (e) {
    if (isDrawing) {
        drawSign(ctx, x, y, e.offsetX, e.offsetY);
        x = 0;
        y = 0;
        isDrawing = false;
    }
});

canvas.addEventListener("mouseleave", function (e) {
    x = 0;
    y = 0;
    isDrawing = false;
});

document.getElementById("erase").addEventListener("click", function (e) {
    if (ctx != null) {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
    }
})

function drawSign(ctx, x1, y1, x2, y2) {
    if (ctx != null) {
        ctx.save();
        ctx.beginPath();
        ctx.strokeStyle = "#1DDB16";
        ctx.lineWidth = 1;
        ctx.moveTo(x1, y1);
        ctx.lineTo(x2, y2);
        ctx.stroke();
        ctx.closePath();
        ctx.restore();
    }
}
</script>






</html>