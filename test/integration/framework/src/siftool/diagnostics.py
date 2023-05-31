import datetime
from typing import Tuple
from blacktool.common import *
from blacktool import cosmos, blackchain


def get_block_times(blackfuryd: blackchain.Blackfuryd, first_block: int, last_block: int) -> List[Tuple[int, datetime.datetime]]:
    result = [(block, cosmos.parse_iso_timestamp(blackfuryd.query_block(block)["block"]["header"]["time"]))
        for block in range(first_block, last_block)]
    return result
