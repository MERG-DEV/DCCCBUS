set_test_name()

beginning_of_test(5)
    --
    begin_test
      --
      configure_can
      --
      wait_until_slim -- Booted into SLiM
      --
      fifo_rx_data(0, OPC_ACON, 1, 9,  17, 32)
      fifo_rx_data(2, OPC_ACOF, 2, 10, 18, 31)
      fifo_rx_data(4, OPC_ASON, 3, 11, 19, 30)
      fifo_rx_data(6, OPC_ASOF, 4, 12, 20, 29)
      fifo_rx_data(1, OPC_ACON, 5, 13, 21, 28)
      fifo_rx_data(3, OPC_ACOF, 6, 14, 22, 27)
      fifo_rx_data(5, OPC_ASON, 7, 15, 23, 26)
      fifo_rx_data(7, OPC_ASOF, 8, 16, 24, 25)
      --
end_of_test
