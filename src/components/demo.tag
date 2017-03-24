<demo>
  <svg version="1.1"
     baseProfile="full"
     width="200" height="200"
     xmlns="http://www.w3.org/2000/svg" class="chart">
      <!--
      <rect x=10"" y="100" width="10" height="100" fill="red" />
      <line x1="15" y1="20" x2="15" y2="220" stroke-width="2" stroke="red"/>

      <rect x="40" y="110" width="10" height="50" fill="green" />
      <line x1="45" y1="20" x2="45" y2="220" stroke-width="2" stroke="green"/>

      <rect x="70" y="100" width="10" height="100" fill="green" />
      <line x1="75" y1="20" x2="75" y2="220" stroke-width="2" stroke="green"/>
      -->
    </svg>

  <script>
    this.on('mount', () => {
      chart();
    });

    function chart () {
      const data = [
        {open: 115, high: 120, low: 100, close: 110},
        {open: 115, high: 120, low: 100, close: 110}
      ];

      const barWidth = 20;
      const width = 200;
      const height = 200;

      const x = d3.scaleLinear()
        .domain([0, data.length])
        .range([0, width]);
      const y = d3.scaleLinear()
        .domain([0, d3.max(data, d => d.high)])
        .range([0, height]);

      const chart = d3.selectAll('.chart')
        .data(data)
        .enter()
        .append('svg:rect')
        .attr('x', (d, index) => x(index))
        .attr('y', d => y(height - d.open))
        .attr('width', barWidth)
        .attr('height', d => y(d.open - d.close))
        .attr('fill', 'green');
    }
  </script>
</demo>
