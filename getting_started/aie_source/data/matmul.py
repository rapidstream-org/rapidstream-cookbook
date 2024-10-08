#!/usr/bin/env python3
__copyright__ = """
Copyright (c) 2024 RapidStream Design Automation, Inc. and contributors.  All rights reserved.
The contributor(s) of this file has/have agreed to the RapidStream Contributor License Agreement.
"""
import numpy as np

M = 2
K = 4
N = 8

A = np.array([i for i in range(M * K)]).reshape(M, K)
B = np.array([i for i in range(K * N)]).reshape(K, N)
print(A)
print(B)


# Multiply matrices
result = np.matmul(A, B)  # or you can use matrix_a @ matrix_b
print(result)
