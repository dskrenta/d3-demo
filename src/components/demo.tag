<demo>
  <!--<svg version="1.1"
     baseProfile="full"
     width="200" height="200"
     xmlns="http://www.w3.org/2000/svg" class="chart">
      <rect x=10"" y="100" width="10" height="100" fill="red" />
      <line x1="15" y1="20" x2="15" y2="220" stroke-width="2" stroke="red"/>

      <rect x="40" y="110" width="10" height="50" fill="green" />
      <line x1="45" y1="20" x2="45" y2="220" stroke-width="2" stroke="green"/>

      <rect x="70" y="100" width="10" height="100" fill="green" />
      <line x1="75" y1="20" x2="75" y2="220" stroke-width="2" stroke="green"/>
  </svg>-->

  <script>
    this.on('mount', () => {
      chart();
    });

    function chart () {
      const data = [
        {open: 115, high: 150, low: 90, close: 100},
        {open: 130, high: 150, low: 90, close: 105},
        {open: 127, high: 150, low: 90, close: 98},
        {open: 187, high: 187, low: 90, close: 95},
        {open: 135, high: 150, low: 90, close: 100},
        {open: 130, high: 150, low: 90, close: 110},
        {open: 110, high: 150, low: 90, close: 107}
      ];

      const barWidth = 20;
      const width = 200;
      const height = 200;

      const x = d3.scaleBand()
        .range([0, width])
        .padding(0.1)
        .domain(data.map((d, index) => index));
      const y = d3.scaleLinear()
        .domain([d3.min(data, d => d.low), d3.max(data, d => d.high)])
        .range([0, height]);

      /*
      const x = d3.scaleLinear()
        .domain([0, data.length])
        .range([0, width]);
      const y = d3.scaleLinear()
        .domain([0, d3.max(data, d => d.high)])
        .range([0, height]);
      */

      const chart = d3.select('demo')
        .append('svg:svg')
        .attr('width', width)
        .attr('height', height);

      const candle = chart.selectAll('.candle')
        .data(data)
        .enter();

      candle.append('svg:line')
        .attr('x1', (d, index) => x(index) + x.bandwidth() / 2)
        .attr('y1', d => y(d.high))
        .attr('x2', (d, index) => x(index) + x.bandwidth() / 2)
        .attr('y2', d => y(d.low))
        .attr('stroke-width', '2')
        .attr('stroke', 'green');

      candle.append('svg:rect')
        .attr('x', (d, index) => x(index))
        .attr('y', d => candleY(y(d.open), y(d.close))) // fix
        .attr('width', x.bandwidth())
        .attr('height', d => candleHeight(y(d.open), y(d.close)))
        .attr('fill', 'green');
    }

    function candleY (open, close) {
      return open < close ? open : close;
    }

    function candleHeight (open, close) {
      if (open < close) {
        // green
        return close - open;
      } else {
        // red
        return open - close;
      }
    }
  </script>
</demo>
