set_test_name()

beginning_of_test(61)
    --
    variable tx_count  : integer;
    --
    begin_test
      --
      set_paired_outputs_off
      set_rcn213_linear_addressing_off
      --
      configure_can
      --
      wait_until_slim -- Booted into SLiM
      --
      input_dcc_extnd_acc(0, 42)
      --
      tx_wait_if_not_ready
      tx_check_can_id(original, 2#10111111#, 2#11100000#)
      --
      tx_count := 12;
      while tx_count > 0 loop
        tx_transmission_error_interrupt
        tx_count := tx_count - 1;
      end loop;
      --
      tx_check_can_id(unchanged, 2#10111111#, 2#11100000#)
      --
      tx_count := 5;
      while tx_count > 0 loop
        tx_arbitration_lost_interrupt
        tx_count := tx_count - 1;
      end loop;
      --
      tx_count := 6;
      while tx_count > 0 loop
        tx_transmission_error_interrupt
        tx_count := tx_count - 1;
      end loop;
      --
      tx_check_can_id(still unchanged, 2#10111111#, 2#11100000#)
      --
      tx_count := 5;
      while tx_count > 0 loop
        tx_arbitration_lost_interrupt
        tx_count := tx_count - 1;
      end loop;
      --
      tx_check_can_id(still unchanged, 2#10111111#, 2#11100000#)
      --
      tx_arbitration_lost_interrupt
      tx_check_can_id(raised priority, 2#01111111#, 2#11100000#)
      --
      tx_count := 5;
      while tx_count > 0 loop
        tx_arbitration_lost_interrupt
        tx_count := tx_count - 1;
      end loop;
      --
      tx_count := 6;
      while tx_count > 0 loop
        tx_transmission_error_interrupt
        tx_count := tx_count - 1;
      end loop;
      --
      tx_check_can_id(still high priority, 2#01111111#, 2#11100000#)
      --
      tx_count := 4;
      while tx_count > 0 loop
        tx_arbitration_lost_interrupt
        tx_count := tx_count - 1;
      end loop;
      --
      tx_check_can_id(still high priority, 2#01111111#, 2#11100000#)
      --
      tx_arbitration_lost_interrupt
      tx_wait_for_node_message(OPC_ASON1, 0, 0, 0, EN high, 0, EN low, 42, Data)
      tx_check_can_id(top priority, 2#00111111#, 2#11100000#)
      --
      input_dcc_basic_acc(1013, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(1013), EN high,
                                               low_byte(1013), EN low)
      --
      tx_count := 12;
      while tx_count > 0 loop
        tx_transmission_error_interrupt
        tx_count := tx_count - 1;
      end loop;
      --
      tx_check_can_id(back to original, 2#10111111#, 2#11100000#)
      --
end_of_test
