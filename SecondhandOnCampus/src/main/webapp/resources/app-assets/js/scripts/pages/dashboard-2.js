/*=========================================================================================
    File Name: dashboard-2.js
    Description: intialize advance cards
    ----------------------------------------------------------------------------------------
    Item Name: Robust - Responsive Admin Theme
    Version: 1.2
    Author: GeeksLabs
    Author URL: http://www.themeforest.net/user/geekslabs
==========================================================================================*/
(function(window, document, $) {
    'use strict';    
    
    /*********************************************
    *               Total Earnings               *
    **********************************************/
    //Get the context of the Chart canvas element we want to select
    var ctx3 = document.getElementById("earning-chart").getContext("2d");

    // Chart Options
    var earningOptions = {
        responsive: true,
        maintainAspectRatio: false,
        datasetStrokeWidth : 3,
        pointDotStrokeWidth : 4,
        tooltipFillColor: "rgba(0,0,0,0.8)",
        legend: {
            display: false,
            position: 'bottom',
        },
        hover: {
            mode: 'label'
        },
        scales: {
            xAxes: [{
                display: false,
            }],
            yAxes: [{
                display: false,
                ticks: {
                    min: 0,
                    max: 70
                },
            }]
        },
        title: {
            display: false,
            fontColor: "#FFF",
            fullWidth: false,
            fontSize: 40,
            text: '82%'
        }
    };

    // Chart Data
    var earningData = {
        labels: ["January", "February", "March", "April", "May", "June", "July"],
        datasets: [{
            label: "My First dataset",
            data: [28, 35, 36, 48, 46, 42, 60],
            backgroundColor: 'rgba(45,149,191,0.1)',
            borderColor: "transparent",
            borderWidth: 0,
            strokeColor : "#ff6c23",
            capBezierPoints: true,
            pointColor : "#fff",
            pointBorderColor: "rgba(45,149,191,1)",
            pointBackgroundColor: "#FFF",
            pointBorderWidth: 2,
            pointRadius: 4,
        }]
    };

    var earningConfig = {
        type: 'line',

        // Chart Options
        options : earningOptions,

        // Chart Data
        data : earningData
    };

    // Create the chart
    var earningChart = new Chart(ctx3, earningConfig);


    /*************************************************
    *               Posts Visits Ratio               *
    *************************************************/
    //Get the context of the Chart canvas element we want to select
    var ctx4 = $("#posts-visits");

    // Chart Options
    var PostsVisitsOptions = {
        responsive: true,
        maintainAspectRatio: false,
        legend: {
            position: 'top',
            labels: {
                boxWidth: 10,
                fontSize: 14
            },
        },
        hover: {
            mode: 'label'
        },
        scales: {
            xAxes: [{
                display: true,
                gridLines: {
                    lineWidth: 2,
                    color: "rgba(0, 0, 0, 0.05)",
                    zeroLineWidth: 2,
                    zeroLineColor: "rgba(0, 0, 0, 0.05)",
                    drawTicks: false,
                },
                ticks: {
                    fontSize: 14,
                }
            }],
            yAxes: [{
                display: false,
                ticks: {
                    min: 0,
                    max: 100
                }
            }]
        },
        title: {
            display: false,
            text: 'Chart.js Line Chart - Legend'
        }
    };

    // Chart Data
    var postsVisitsData = {
        labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
        datasets: [{
            label: "Visits",
            data: [32, 25, 45, 30, 60, 40, 72, 52, 80, 60, 92, 70],
            lineTension: 0,
            fill: false,
            // borderDash: [5, 5],
            borderColor: "#37BC9B",
            pointBorderColor: "#37BC9B",
            pointBackgroundColor: "#FFF",
            pointBorderWidth: 3,
            pointRadius: 6,
        }, {
            label: "Posts",
            data: [12, 10, 25, 15, 35, 22, 42, 28, 50, 32, 58, 28],
            lineTension: 0,
            fill: false,
            borderColor: "#967ADC",
            pointBorderColor: "#967ADC",
            pointBackgroundColor: "#FFF",
            pointBorderWidth: 3,
            pointRadius: 6,
        }]
    };

    var postsVisitsConfig = {
        type: 'line',

        // Chart Options
        options : PostsVisitsOptions,

        data : postsVisitsData
    };

    // Create the chart
    var postsVisitsChart = new Chart(ctx4, postsVisitsConfig);


})(window, document, jQuery);
