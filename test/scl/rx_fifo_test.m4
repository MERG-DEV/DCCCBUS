set_test_name()

beginning_of_test(7)
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
      fifo_rx_data(0, OPC_ACON,  9, 9,  17, 32)
      fifo_rx_data(1, OPC_ASON, 10, 10, 18, 31)
      fifo_rx_data(2, OPC_ACOF, 11, 11, 19, 30)
      fifo_rx_data(3, OPC_ASOF, 12, 12, 20, 29)
      fifo_rx_data(4, OPC_ACON, 13, 13, 21, 28)
      fifo_rx_data(5, OPC_ACOF, 14, 14, 22, 27)
      fifo_rx_data(6, OPC_ASON, 15, 15, 23, 26)
      fifo_rx_data(7, OPC_ASOF, 16, 16, 24, 25)
      --
      fifo_rx_data(7, OPC_ACON, 17, 9,  17, 32)
      fifo_rx_data(6, OPC_ASON, 18, 10, 18, 31)
      fifo_rx_data(5, OPC_ACOF, 19, 11, 19, 30)
      fifo_rx_data(4, OPC_ASOF, 20, 12, 20, 29)
      fifo_rx_data(0, OPC_ACON, 21, 13, 21, 28)
      fifo_rx_data(1, OPC_ACOF, 22, 14, 22, 27)
      fifo_rx_data(2, OPC_ASON, 23, 15, 23, 26)
      fifo_rx_data(3, OPC_ASOF, 24, 16, 24, 25)
      --
end_of_test
