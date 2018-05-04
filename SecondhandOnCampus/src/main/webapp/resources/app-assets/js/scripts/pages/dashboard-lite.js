/*=========================================================================================
    File Name: dashboard-lite.js
    Description: intialize advance cards
    ----------------------------------------------------------------------------------------
    Item Name: Robust - Responsive Admin Theme
    Version: 1.2
    Author: GeeksLabs
    Author URL: http://www.themeforest.net/user/geekslabs
==========================================================================================*/
(function(window, document, $) {
    'use strict';

    /**********************************************************
    *                    Projects Task Status                  *
    **********************************************************/
    //Get the context of the Chart canvas element we want to select
    var ctx2 = $("#line-stacked-area");

    // Chart Options
    var userPageVisitOptions = {
        responsive: true,
        maintainAspectRatio: false,
        pointDotStrokeWidth : 4,
        legend: {
            display: false,
            labels: {
                fontColor: '#FFF',
                boxWidth: 10,
            },
            position: 'top',
        },
        hover: {
            mode: 'label'
        },
        scales: {
            xAxes: [{
                display: false,
            }],
            yAxes: [{
                display: true,
                gridLines: {
                    color: "rgba(255,255,255, 0.3)",
                    drawTicks: false,
                    drawBorder: false
                },
                ticks: {
                    display: false,
                    min: 0,
                    max: 70,
                    maxTicksLimit: 4
                },
            }]
        },
        title: {
            display: false,
            text: 'Chart.js Line Chart - Legend'
        },
    };
    
    /****************************************************
    *               Employee Satisfaction               *
    ****************************************************/
    //Get the context of the Chart canvas element we want to select
    var ctx1 = document.getElementById("emp-satisfaction").getContext("2d");

    // Create Linear Gradient
    var white_gradient = ctx1.createLinearGradient(0, 0, 0,400);
    white_gradient.addColorStop(0, 'rgba(255,255,255,0.5)');
    white_gradient.addColorStop(1, 'rgba(255,255,255,0)');

    // Chart Options
    var empSatOptions = {
        responsive: true,
        maintainAspectRatio: false,
        datasetStrokeWidth : 3,
        pointDotStrokeWidth : 4,
        tooltipFillColor: "rgba(0,0,0,0.8)",
        legend: {
            display: false,
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
                    max: 85
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
    var empSatData = {
        labels: ["January", "February", "March", "April", "May", "June", "July"],
        datasets: [{
            label: "Employees",
            data: [28, 35, 36, 48, 46, 42, 60],
            backgroundColor: white_gradient,
            borderColor: "rgba(255,255,255,1)",
            borderWidth: 2,
            strokeColor : "#ff6c23",
            pointColor : "#fff",
            pointBorderColor: "rgba(255,255,255,1)",
            pointBackgroundColor: "#3BAFDA",
            pointBorderWidth: 2,
            pointHoverBorderWidth: 2,
            pointRadius: 5,
        }]
    };

    var empSatconfig = {
        type: 'line',

        // Chart Options
        options : empSatOptions,

        // Chart Data
        data : empSatData
    };

    // Create the chart
    var areaChart = new Chart(ctx1, empSatconfig);

    // Chart Data
    var userPageVisitData = {
        labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
        datasets: [
        {
            label: "Android",
            data: [18, 15, 30, 25, 28, 35, 14, 18, 12, 20, 18, 24],
            backgroundColor: 'transparent',
            borderColor: "#FF6E40",
            pointColor : "#fff",
            pointBorderColor: "#FF6E40",
            pointBackgroundColor: "#fff",
            pointBorderWidth: 2,
            pointHoverBorderWidth: 2,
            pointRadius: 3,
        },{
            label: "iOS",
            data: [30, 35, 60, 40, 45, 55, 32, 45, 58, 53, 45, 60],
            backgroundColor: 'transparent',
            borderColor: "#1DE9B6",
            pointColor : "#fff",
            pointBorderColor: "#1DE9B6",
            pointBackgroundColor: "#fff",
            pointBorderWidth: 2,
            pointHoverBorderWidth: 2,
            pointRadius: 3,
        }]
    };

    var userPageVisitConfig = {
        type: 'line',
        // Chart Options
        options : userPageVisitOptions,
        // Chart Data
        data : userPageVisitData
    };

    // Create the chart
    var stackedAreaChart = new Chart(ctx2, userPageVisitConfig);

    // Live chart update random data for the new entry
    setInterval(function() {
        setStackedAreaChartData(stackedAreaChart.data.datasets[0].data, 5, 25);
        setStackedAreaChartData(stackedAreaChart.data.datasets[1].data, 35, 60);
    }, 3500);
    function setStackedAreaChartData(data, minValue, maxValue) {
        data.push(Math.floor(Math.random() * (maxValue - minValue + 1)) + minValue);
        data.shift();
        stackedAreaChart.update();
    }


})(window, document, jQuery);
