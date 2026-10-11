set_test_name()

beginning_of_test(935)
  begin_test
    --
    set_paired_outputs_on
    --
    configure_can
    --
    wait_until_slim -- Booted into SLiM
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 0, EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 0, EN low)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 1, EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 1, EN low)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 2, EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 2, EN low)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 3, EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 3, EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 4, EN low)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 4, EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 5, EN low)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 5, EN low)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 254, EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 254, EN low)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 255, EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 255, EN low)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(256), EN high,
                                                  low_byte(256), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(256), EN high,
                                                 low_byte(256), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(508), EN high,
                                                  low_byte(508), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(508), EN high,
                                                  low_byte(508), EN low)
    --
    log(Individual 510 Deactivation ignored)
    --
    log(Individual 510 Activation translated as pair 255 Deactivation)
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(255), EN high,
                                                  low_byte(255), EN low)
    --
    log(Individual 511 Deactivation ignored)
    --
    log(Individual 511 Activation translated as pair 255 Activation)
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(255), EN high,
                                                  low_byte(255), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(1023), EN high,
                                                  low_byte(1023), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(1023), EN high,
                                                  low_byte(1023), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(1024), EN high,
                                                  low_byte(1024), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(1024), EN high,
                                                  low_byte(1024), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(1025), EN high,
                                                  low_byte(1025), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(1025), EN high,
                                                  low_byte(1025), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2044), EN high,
                                                  low_byte(2044), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2044), EN high,
                                                  low_byte(2044), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2045), EN high,
                                                  low_byte(2045), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2045), EN high,
                                                  low_byte(2045), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2046), EN high,
                                                  low_byte(2046), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2046), EN high,
                                                  low_byte(2046), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2047), EN high,
                                                  low_byte(2047), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2047), EN high,
                                                  low_byte(2047), EN low)
    --
  end_test
  --
  input_dcc_packets: process is
    begin
      log(Begin DCC generation)
      input_dcc_idle
      log(Begin DCC packets)
      input_dcc_basic_acc_pair(0, Deactivate)
      input_dcc_basic_acc_pair(0, Activate)
      input_dcc_basic_acc_pair(1, Deactivate)
      input_dcc_basic_acc_pair(1, Activate)
      input_dcc_basic_acc_pair(2, Deactivate)
      input_dcc_basic_acc_pair(2, Activate)
      input_dcc_basic_acc_pair(3, Deactivate)
      input_dcc_basic_acc_pair(3, Activate)
      input_dcc_basic_acc_pair(4, Activate)
      input_dcc_basic_acc_pair(4, Deactivate)
      input_dcc_basic_acc_pair(5, Activate)
      input_dcc_basic_acc_pair(5, Deactivate)
      input_dcc_basic_acc_pair(254, Deactivate)
      input_dcc_basic_acc_pair(254, Activate)
      input_dcc_basic_acc_pair(255, Deactivate)
      input_dcc_basic_acc_pair(255, Activate)
      input_dcc_basic_acc_pair(256, Deactivate)
      input_dcc_basic_acc_pair(256, Activate)
      input_dcc_basic_acc_pair(508, Deactivate)
      input_dcc_basic_acc_pair(508, Activate)
      input_dcc_basic_acc(510, Deactivate)
      input_dcc_basic_acc(510, Activate)
      input_dcc_basic_acc(511, Deactivate)
      input_dcc_basic_acc(511, Activate)
      input_dcc_basic_acc_pair(1023, Deactivate)
      input_dcc_basic_acc_pair(1023, Activate)
      input_dcc_basic_acc_pair(1024, Deactivate)
      input_dcc_basic_acc_pair(1024, Activate)
      input_dcc_basic_acc_pair(1025, Deactivate)
      input_dcc_basic_acc_pair(1025, Activate)
      input_dcc_basic_acc_pair(2044, Deactivate)
      input_dcc_basic_acc_pair(2044, Activate)
      input_dcc_basic_acc_pair(2045, Deactivate)
      input_dcc_basic_acc_pair(2045, Activate)
      input_dcc_basic_acc_pair(2046, Deactivate)
      input_dcc_basic_acc_pair(2046, Activate)
      input_dcc_basic_acc_pair(2047, Deactivate)
      input_dcc_basic_acc_pair(2047, Activate)
      log(DCC packets complete)
      wait;
    end process input_dcc_packets;
  --
end testbench;
