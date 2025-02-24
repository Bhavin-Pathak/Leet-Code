int mostProfitablePath(List<List<int>> edges, int bob, List<int> amount) {
  int n = amount.length;

  // Step 1: Construct the tree using an adjacency list
  List<List<int>> tree = List.generate(n, (_) => []);
  for (var edge in edges) {
    int u = edge[0], v = edge[1];
    tree[u].add(v);
    tree[v].add(u);
  }

  // Step 2: Find Bob's path to the root and store the earliest time he reaches each node
  List<int> bobTime = List.filled(
    n,
    1 << 30,
  ); // Use a large value as 'infinity'

  bool findBobPath(int node, int parent, int time) {
    if (node == 0) {
      // If Bob reaches root, store the time
      bobTime[node] = time;
      return true;
    }
    for (var neighbor in tree[node]) {
      if (neighbor != parent && findBobPath(neighbor, node, time + 1)) {
        bobTime[node] = time; // Record Bob's time at this node
        return true;
      }
    }
    return false;
  }

  findBobPath(bob, -1, 0); // Start from Bob's position moving to root

  // Step 3: DFS to compute Alice's maximum profit
  int maxProfit = -1 << 30; // Initialize with a very small number

  void dfs(int node, int parent, int time, int profit) {
    // If Alice reaches the node first, she gets full amount
    if (time < bobTime[node]) {
      profit += amount[node];
    }
    // If Alice and Bob reach at the same time, they split the amount
    else if (time == bobTime[node]) {
      profit += (amount[node] / 2).floor();
    }

    bool isLeaf = true; // Assume node is a leaf until proven otherwise
    for (var neighbor in tree[node]) {
      if (neighbor != parent) {
        isLeaf = false;
        dfs(neighbor, node, time + 1, profit);
      }
    }

    // If it's a leaf node, update the maximum profit
    if (isLeaf) {
      maxProfit = maxProfit > profit ? maxProfit : profit;
    }
  }

  dfs(0, -1, 0, 0); // Start DFS from the root

  return maxProfit;
}

// Example test cases
void main() {
  print(
    mostProfitablePath(
      [
        [0, 1],
        [1, 2],
        [1, 3],
        [3, 4],
      ],
      3,
      [-2, 4, 2, -4, 6],
    ),
  ); // Output: 6
  print(
    mostProfitablePath(
      [
        [0, 1],
      ],
      1,
      [-7280, 2350],
    ),
  ); // Output: -7280
}
