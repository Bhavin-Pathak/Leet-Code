function mostProfitablePath(edges, bob, amount) {
    const n = amount.length;
    const tree = Array.from({ length: n }, () => []);

    // Step 1: Construct the tree using adjacency list
    for (const [u, v] of edges) {
        tree[u].push(v);
        tree[v].push(u);
    }

    // Step 2: Find Bob's path to the root and record the earliest time Bob reaches each node
    let bobTime = Array(n).fill(Infinity);

    function findBobPath(node, parent, time) {
        if (node === 0) { // If we reach the root, record the time
            bobTime[node] = time;
            return true;
        }
        for (const neighbor of tree[node]) {
            if (neighbor !== parent && findBobPath(neighbor, node, time + 1)) {
                bobTime[node] = time; // Record when Bob reaches this node
                return true;
            }
        }
        return false;
    }

    findBobPath(bob, -1, 0); // Start from Bob's position, moving towards root

    // Step 3: DFS to compute the maximum profit for Alice
    let maxProfit = -Infinity;

    function dfs(node, parent, time, profit) {
        // If Alice reaches the node first, she gets the full amount
        if (time < bobTime[node]) {
            profit += amount[node];
        } 
        // If Alice and Bob reach at the same time, they share the amount
        else if (time === bobTime[node]) {
            profit += amount[node] / 2;
        }

        let isLeaf = true; // Assume node is a leaf until proven otherwise
        for (const neighbor of tree[node]) {
            if (neighbor !== parent) {
                isLeaf = false;
                dfs(neighbor, node, time + 1, profit);
            }
        }

        // If it's a leaf node, update the maximum profit
        if (isLeaf) {
            maxProfit = Math.max(maxProfit, profit);
        }
    }

    dfs(0, -1, 0, 0); // Start DFS from the root

    return maxProfit;
}

// Example test cases
console.log(mostProfitablePath([[0,1],[1,2],[1,3],[3,4]], 3, [-2,4,2,-4,6])); // Output: 6
console.log(mostProfitablePath([[0,1]], 1, [-7280,2350])); // Output: -7280
