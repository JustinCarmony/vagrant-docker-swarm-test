#!/bin/bash
vagrant provision salt
vagrant ssh salt -c "sudo salt \\* --state-output=mixed state.highstate"