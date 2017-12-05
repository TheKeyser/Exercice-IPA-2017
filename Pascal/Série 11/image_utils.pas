(**
 * image_utils.pas - Utils for image processing
 *)

{$mode objfpc}{$h+}

unit image_utils;

interface

uses
    classes, sysutils, FPImage, FPCanvas, FPImgCanv,
    FPWritePNG, FPReadpng, FPReadgif;

const
    MAX_RGB         = 65535;
    HISTO_WIDTH     = 600;
    HISTO_HEIGHT    = 350;
    HISTO_MARGIN    = 20;

type
    TPixel = record
                red     : integer;
                green   : integer;
                blue    : integer;
            end;

    TPixelsArray = array of array of TPixel;

    TImage = record
                pixels  : TPixelsArray;
                width   : integer;
                height  : integer;
            end;

    THistogram = array[0..255] of integer;

(* open a GIF image *)
function open_image(filename:string; width,height:integer):TImage;

(* save a given image as a PNG *)
procedure save_image(filename:string; image:TImage);

procedure plot_histogram(filename:string; histo:THistogram);

implementation

function normalize_rgb(color:TFPColor):TPixel;
var
    pixel :TPixel;
begin
    pixel.red   := round((color.red / MAX_RGB) * 255);
    pixel.green := round((color.green / MAX_RGB) * 255);
    pixel.blue  := round((color.blue / MAX_RGB) * 255);

    normalize_rgb := pixel;
end;

function unnormalize_rgb(pixel:TPixel):TFPColor;
var
    color:TFPColor;
begin
    color.red   := round((pixel.red / 255) * MAX_RGB);
    color.green := round((pixel.green / 255) * MAX_RGB);
    color.blue  := round((pixel.blue / 255) * MAX_RGB);
    color.alpha := MAX_RGB;

    unnormalize_rgb := color;
end;

function open_image(filename:string;width,height:integer):TImage;
var
    i,j     :integer;
    rval    :TImage;
    image   :TFPCustomImage;
    reader  :TFPCustomImageReader;
begin
    setLength(rval.pixels, width, height);
    rval.width      := width;
    rval.height     := height;

    image := TFPMemoryImage.Create(width, height);
    image.UsePalette := false;
    reader := TFPReaderPNG.Create;
    {reader := TFPReaderGIF.Create;}

    image.LoadFromFile(filename, reader);
    
    
    for i := 0 to width-1 do begin
        for j := 0 to height-1 do begin
            rval.pixels[i,j] := normalize_rgb(image[j,i]);
        end;
    end;

    (* free memory *)
    image.free;
    reader.free;

    open_image := rval;
end;

procedure save_image(filename:string; image:TImage);
var
    i,j         :integer;
    tfpimage    :TFPCustomImage;
    writer      :TFPCustomImageWriter;
    pixel       :TPixel; (* current pixel color *)
begin
    tfpimage := TFPMemoryImage.Create(image.width, image.height);
    tfpimage.UsePalette := false;

    {writeln('width=',image.width,'; height=',image.height);}
    for i := 0 to image.width-1 do begin
        for j := 0 to image.height-1 do begin
            {writeln('i=',i,'; j=',j);}
            pixel := image.pixels[i,j];
            tfpimage[j,i] := unnormalize_rgb(pixel);
        end;
    end;
    
    

    (* save image *)
    writer := TFPWriterPNG.Create;
    tfpimage.SaveToFile(filename, writer);
     {writeln('here');}

    (* free memory *)
    tfpimage.free;
    writer.free;
end;

procedure draw_axis(var image:TFPCustomImage; color:TFPColor);
var
    i :integer;
begin
    (* draw Y axis *)
    for i := HISTO_MARGIN to image.height-HISTO_MARGIN do
        //image[i,image.width-HISTO_MARGIN] := color;
        image[HISTO_MARGIN,i] := color;

    (* draw X axis *)
    for i := HISTO_MARGIN to image.width-HISTO_MARGIN do
        image[i,image.height-HISTO_MARGIN] := color;
end;

procedure draw_bg(var image:TFPCustomImage; color:TFPColor);
var
    i,j :integer;
begin
    for i := 0 to image.height-1 do begin
        for j := 0 to image.width-1 do begin
            image[j,i] := color;
        end;
    end;
end;

procedure draw_bar(var image:TFPCustomImage;index,value,max:integer;color:TFPColor);
var
    x,y,ymax :integer;
begin
    x := HISTO_MARGIN + (index * trunc((HISTO_WIDTH-(2*HISTO_MARGIN))/255));
    ymax := image.height-HISTO_MARGIN;
    ymax := ymax - trunc(((HISTO_HEIGHT-(2*HISTO_MARGIN))/max) * value);

    for y := image.height-HISTO_MARGIN downto ymax do
        image[x,y] := color;
end;

procedure plot_histogram(filename:string; histo:THistogram);
var
    i           :integer;
    image       :TFPCustomImage;
    writer      :TFPCustomImageWriter;
    (*pixel       :TPixel;*) (* current pixel color *)
    whiteColor  :TFPColor = (Red: MAX_RGB; Green: MAX_RGB; Blue: MAX_RGB;
        Alpha: MAX_RGB);
    blueColor   :TFPColor = (Red: 0; Green: 0; Blue: MAX_RGB;
        Alpha: MAX_RGB);
    blackColor  :TFPColor = (Red: 0; Green: 0; Blue: 0;
        Alpha: MAX_RGB);
begin
    image := TFPMemoryImage.Create(HISTO_WIDTH, HISTO_HEIGHT);
    image.UsePalette := false;

    draw_bg(image, whiteColor);
    draw_axis(image, blackColor);

    for i := 0 to length(histo)-1 do
        draw_bar(image, i, histo[i], 42*255, blueColor);

    (* save image *)
    writer := TFPWriterPNG.Create;
    image.SaveToFile(filename, writer);

    (* free memory *)
    image.free;
    writer.free;
end;

end.
