<img src="https://avatars.githubusercontent.com/u/8545049?s=200&v=4" height="70"> <a href="https://plotly.com/javascript/"><img src="https://images.plot.ly/logo/plotlyjs-logo@2x.png" height="70"></a>

# seaside-plotlyjs
This library provides a wrapper, including a builder class and specific abstractions, to create [Plotly.js](https://plotly.com/javascript/) plots from your [Seaside](https://github.com/SeasideSt/Seaside) canvas classes.

<p align="center">
    <a href="https://plotly.com/javascript/" target="_blank">
        <img src="https://raw.githubusercontent.com/cldougl/plot_images/add_r_img/plotly_2017.png">
    </a>
</p>



## Sample code


```smalltalk
renderContentOn: html
  | plotly |
  html div id: 'plotContainer'.
  plotly := html plotly: 'plotContainer'.
  plotly
    data:
      {(PlotlyTrace scatter
        name: 'Scatter series';
        showlegend: true;
        mode: 'markers';
        x: (1 to: 10);
        y: ((1 to: 10) collect: [ :each | 10 atRandom / 2 ]);
        yourself).
      (PlotlyTrace scatter
        name: 'Line series';
        showlegend: true;
        x: (1 to: 10);
        y: ((1 to: 10) collect: [ :each | 10 atRandom / 2 ]);
        yourself)};
    layout:
      (PlotlyLayout new
        title: (PlotlyText text: 'Simple plot');
        width: 500 height: 300;
        yourself).
  plotly config beResponsive.
  html document addLoadScript: plotly
``` 


```smalltalk
renderContentOn: html
  | plotly |
  html div id: 'plotContainer'.
  plotly := html plotly: 'plotContainer'.
  plotly
    data:
      {(PlotlyTrace pie
        hole: 0.4;
        values: #(19 , 26 , 55);
        labels: #('Residential' , 'Non-Residential' , 'Utility'))};
    layout:
      (PlotlyLayout new
        title: (PlotlyText text: 'Donut Chart');
        width: 500 height: 300;
        yourself).
  plotly config beResponsive.
  html document addLoadScript: plotly
```

## Installation

```smalltalk
Metacello new
	repository: 'github://emaringolo/seaside-plotlyjs/src';
	baseline: 'Plotly';
	load.
```

## Plotly.js library

Given that the full Plotly.js library is heavy (~3.5MB mimized) and it is common to [build a custom bundle](https://github.com/plotly/plotly.js/blob/master/CUSTOM_BUNDLE.md) with only the plots used, this wrapper doesn't provide a [FileLibrary](https://github.com/SeasideSt/Seaside/wiki/FileLibrary), and instead you have to link to the library, either by using a [CDN](https://plotly.com/javascript/getting-started/#plotlyjs-cdn) or downloading it and linking to the file location.


```smalltalk
updateRoot: anHtmlRoot
	super updateRoot: anHtmlRoot.
	anHtmlRoot script url: 'https://cdn.plot.ly/plotly-2.4.2.min.js'.
        "..."
```

## Examples

After installing the default group, you can access `http://localhost:8080/plotly` to access an example component showing the different kind of plots, and the smalltalk code to produce them.

## Future steps
Add more examples about how to create other kind of plots (Surface, Mesh), and multiple plots, axis sharing, etc.
