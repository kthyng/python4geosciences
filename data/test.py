"""Test package.py"""

import package
import numpy as np


def test_add_12():
    """Test package with inputs 1, 2"""

    assert package.add(1, 2) == np.sum([1, 2])
