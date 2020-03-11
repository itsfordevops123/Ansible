[
    {
      Application: 'WebApp01',
      Version: '1.0.1',
      Uptime: '{{integer(1000, 100000)}}',
      Request_Count: '{{bool()}}',
      Error_Count: '{{integer(1000, 4000 * 2)}}',
      Success_Count: '{{integer(1000, 80000 * 2)}}'
    }
  ]

