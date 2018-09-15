import java.util.Arrays;
float[] values;

void showArray() {
  println(Arrays.toString(values));
}

void setup() {
  //size(600, 400);
  //values = new float[width];
  //for (int i = 0; i < values.length; i++) {
  //  values[i] = random(height);
  //}
 // noLoop();
 values = new float[15];
 for (int i = 0; i < values.length; i++) {
   values[i] = floor(random(10));
 }
 showArray();
 quicksort(values, 0 , values.length-1);
}
void quicksort(float[] arr, int lo, int hi) {
  if (lo < hi) {
    int mid = partition(arr, lo, hi);
    showArray();
    quicksort(arr, lo, mid-1);
    showArray();
    quicksort(arr, mid+1, hi);
    showArray();
  }
}

// Working partition code from:
// https://www.geeksforgeeks.org/quick-sort/

//int partition (float arr[], int low, int high) {
//  float pivot = arr[high];  
//  int i = (low - 1);  
//  for (int j = low; j <= high- 1; j++) {
//    if (arr[j] <= pivot) {
//      i++;
//      swap(arr, i, j);
//    }
//  }
//  swap(arr, i+1, high);
//  return (i + 1);
//}

//void mousePressed() {
//  quicksort(values, 0, values.length-1);
//}

//void draw() {
//  render();
//  println("Help");
//}

// Broken partition code that I tried to write
// TODO: Help!

// It should be fixed now. The make the println into comments if you want.
// The error was in the exit condition:
// the right index was going lower than the left
// and you were always returning the left index even if you didn't swap.
int partition(float[] arr, int lo, int hi) {
  println("Partition " + lo + " to " + hi);
  float pivot = arr[hi];
  int left = lo-1;
  int right = hi-1;
  
  while (left < right) {
    left++;
    println("The LEFT index is: "+left+", while the RIGHT index is: "+ right);
    println("Let's compare the value ("+arr[left]+") at the LEFT index with the PIVOT ("+pivot+").");
    if (arr[left] >= pivot) {
      println("It's larger than/equal to the Pivot!");
      println("Need to find something to swap it with.");
      while (right > left) {
        println("Let's try with the value "+arr[right]+" which is at the RIGHT index "+right);
        println("Is it smaller than PIVOT?");
        if (arr[right] < pivot) {
          println("Yes! Let's swap the value at the RIGHT index with the one at the LEFT index.");
          swap(arr, left, right);
          break;
        } else {
          println("Nope... Try again.");
          right--;
        }
      }
    } else{
      println("Smaller... Try again.");
    }
  }
  
  println("I couldn't find anything to swap with the value at the LEFT index");
  if (arr[left] >= arr[right] && arr[right] >= pivot) {
    println(" ");
    println("Since LEFT: "+left+" equals RIGHT: "+right);
    println("and the value at the RIGHT index is larger than the PIVOT,");
    println("swap with the PIVOT, because every value is larger than the PIVOT.");
    swap(arr, left, hi);
    println("Return the LEFT index as the MID");
    println(" ");
    return left;
  } else {
    println(" ");
    println("It must mean that every value is smaller than the Pivot.");
    println("Don't swap and return the Pivot index as the MID.");
    println(" ");
    return hi;
  }
}


void render() {
  background(0);
  for (int i = 0; i < values.length; i++) {
    stroke(255);
    line(i, height, i, height - values[i]);
  }
}

void swap(float[] arr, int a, int b) {
  println("Swapping " +a+" for "+b);
  float temp = arr[a];
  arr[a] = arr[b];
  arr[b] = temp;


  redraw();
}
